#
# Cookbook Name:: rvm-installer
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
rvm_ruby "ruby-2.0.0" do
  action :install
end

rvm_default_ruby "ruby-2.0.0"

rvm_gem 'rails' do
  ruby_string "ruby-2.0.0"
  version '4.0.2'
  action :install
end
