# -*- coding: utf-8 -*-
require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start! { add_filter 'chef-client-hardening' }

require 'chef/application'

describe 'chef-client-hardening::default' do
  let(:subject) do
    ChefSpec::SoloRunner.new(platform: 'debian',
                             version: '9.3').converge(described_recipe)
  end

  before do
    allow(Dir).to receive(:glob).with('/etc/chef/*').and_return(['/etc/chef/client.rb', '/etc/chef/client.pem'])
    allow(Dir).to receive(:glob).with('/var/chef/*').and_return(['/var/chef/cache'])

    allow(File).to receive(:directory?).and_call_original
    allow(File).to receive(:file?).and_call_original
    allow(File).to receive(:directory?).with('/etc/chef/client.rb').and_return(false)
    allow(File).to receive(:file?).with('/etc/chef/client.rb').and_return(true)
    allow(File).to receive(:directory?).with('/etc/chef/client.pem').and_return(false)
    allow(File).to receive(:file?).with('/etc/chef/client.pem').and_return(true)
    allow(File).to receive(:directory?).with('/var/chef/cache').and_return(true)
    allow(File).to receive(:file?).with('/var/chef/cache').and_return(false)
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
   '/etc/chef/client.pem'].each do |f|
    it "creates file[#{f}]" do
      expect(subject).to create_file(f)
        .with(mode: '0600',
              owner: 'root',
              group: 'root')
    end
  end
end
