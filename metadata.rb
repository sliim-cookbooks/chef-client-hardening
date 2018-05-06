# -*- coding: utf-8 -*-
name 'chef-client-hardening'
maintainer 'Sliim'
maintainer_email 'sliim@mailoo.org'
license 'Apache-2.0'
description 'Set correct owner/permissions for chef-client sensitive files'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.0'
chef_version '>= 12.0' if respond_to?(:chef_version)

recipe 'default', 'Set owner/permissions of sensitive files'

supports 'ubuntu'
supports 'debian'
supports 'centos'
supports 'fedora'

source_url 'https://github.com/sliim-cookbooks/chef-client-hardening' if
  respond_to?(:source_url)
issues_url 'https://github.com/sliim-cookbooks/chef-client-hardening/issues' if
  respond_to?(:issues_url)
