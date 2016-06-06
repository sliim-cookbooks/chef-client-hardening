# -*- coding: utf-8 -*-
#
# Cookbook Name:: chef-client-hardening
# Recipe:: default
#
# Copyright 2015, Sliim
#

directory '/etc/chef' do
  mode '0700'
  owner 'root'
  group 'root'
end

node['chef-client-hardening']['extra_dirs'].each do |dir|
  directory dir do
    mode '0700'
    owner 'root'
    group 'root'
  end
end

['/etc/chef/client.rb',
 '/etc/chef/client.pem'].each do |f|
  file f do
    mode '0600'
    owner 'root'
    group 'root'
  end
end

node['chef-client-hardening']['extra_files'].each do |f|
  file f do
    mode '0600'
    owner 'root'
    group 'root'
  end
end
