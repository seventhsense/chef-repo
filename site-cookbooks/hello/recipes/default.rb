#
# Cookbook Name:: hello
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
log "Hello World"
# package "vim" do
  # action :install
# end
package "git" do
  action :install
end

# package "nodejs" do
  # action :install
# end

# package "npm" do
  # action :install
# end
