#
# Cookbook Name:: myapache-cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

log "*** Time in epoch is now: #{lib_epoch}"

package node['myapache-cookbook']['package'] do
  action :install
end

service node['myapache-cookbook']['package'] do
  action [:enable, :start]
end

service 'iptables' do
  action [:disable, :stop]
end
