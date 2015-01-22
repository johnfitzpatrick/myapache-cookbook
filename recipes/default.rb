#
# Cookbook Name:: myapache-cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

log "*** Time in epoch is: #{lib_epoch}"

case node['platform_family']
when 'debian'
  package_name = 'apache2'
when 'rhel'
  package_name = 'httpd'
end

package package_name do
  action :install
end

service package_name do
  action [:enable, :start]
end

service 'iptables' do
  action [:disable, :stop]
end













ruby_block 'before_breakpoint1' do
  block do
    node.run_state['where'] = 'before'
  end
end

log "*** Before breakpoint1"

breakpoint "breakpoint1"

log "*** After breakpoint1"

ruby_block 'after_breakpoint1' do
  block do
    node.run_state['where'] = 'after'
  end
end

breakpoint "second_breakpoint"

# chef-shell -z
# recipe_mode
# run_chef
# Chef::Log.level = :info
# puts node.run_state['where']
# chef_run.step
# chef_run.step
# puts node.run_state['where']
