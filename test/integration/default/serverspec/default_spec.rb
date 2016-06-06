# -*- coding: utf-8 -*-

require 'serverspec'

set :backend, :exec
set :path, '$PATH:/sbin:/usr/sbin:/usr/bin:/bin'

describe file '/etc/chef' do
  it { should be_directory }
  it { should be_mode 700 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file '/etc/chef/client.rb' do
  it { should be_file }
  it { should be_mode 600 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file '/etc/chef/client.pem' do
  it { should be_file }
  it { should be_mode 600 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
