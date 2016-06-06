# -*- coding: utf-8 -*-
require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start! { add_filter 'chef-client-hardening' }

require 'chef/application'

describe 'chef-client-hardening::default' do
  let(:subject) do
    ChefSpec::SoloRunner.new do |node|
      node.set['chef-client-hardening']['extra_files'] = ['/var/chef/cache/chef-client-running.pid']
      node.set['chef-client-hardening']['extra_dirs'] = ['/var/chef', '/var/chef/cache']
    end.converge(described_recipe)
  end

  ['/etc/chef',
   '/var/chef',
   '/var/chef/cache'].each do |d|
    it "creates directory[#{d}]" do
      expect(subject).to create_directory(d)
        .with(mode: '0700',
              owner: 'root',
              group: 'root')
    end
  end

  ['/etc/chef/client.rb',
   '/etc/chef/client.pem',
   '/var/chef/cache/chef-client-running.pid'].each do |d|
    it "creates file[#{d}]" do
      expect(subject).to create_file(d)
        .with(mode: '0600',
              owner: 'root',
              group: 'root')
    end
  end
end
