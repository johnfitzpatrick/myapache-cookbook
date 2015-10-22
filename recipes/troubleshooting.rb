#
# Cookbook Name:: myapache-cookbook
# Recipe:: troubleshooting
#
# Copyright 2015, Great Websites Inc
#

require 'pp'
# Debug a node attribute(ie: node['myapache-cookbook']['ap_path']) to see where is the value set, etc
pp node.debug_value('myapache-cookbook', 'ap_path')

# Really good gem to pretty print hashes, objects, etc
if node['myapache-cookbook']['ap_path']
  chef_gem 'awesome_print' do
    source node['myapache-cookbook']['ap_path']
    compile_time true
  end
  require 'awesome_print'
end

# Only enter here if chef-client is run from /tmp
# This prevents scheduled runs from hanging in `binding.pry`
if (ENV['PWD'] == '/tmp')
  # Stop chef-client and provide a `pry` prompt for troubleshooting
  require 'pry'
  binding.pry
  # gem 'pry-byebug' can be used to step through
end

if Chef::Config[:chef_server_url] !~ %r{/organizations/}
  Chef::Log.warn('*** "organizations" is missing from the url!')
end
