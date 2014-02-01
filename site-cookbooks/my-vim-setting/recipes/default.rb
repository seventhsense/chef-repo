#
# Cookbook Name:: my-vim-setting
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
log "my-vim-setting"

directory "/home/vagrant/.vim" do
  owner "vagrant"
  group "vagrant"
  action :create
end

directory "/home/vagrant/.vim/bundle" do
  owner "vagrant"
  group "vagrant"
  action :create
end

git "/home/vagrant/.vim/bundle/neobundle.vim" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/Shougo/neobundle.vim"
  reference "master"
  action :sync
end

git "/home/vagrant/dot-vim-files" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/seventhsense/dot-vim-files.git"
  reference "master"
  action :sync
end

link "/home/vagrant/.vimrc" do
  to "/home/vagrant/dot-vim-files/.vimrc"
  owner "vagrant"
  group "vagrant"
end

bash "my-vim-setting" do
  user "vagrant"
  cwd "/home/vagrant"
  code <<-EOH
  npm install jshint -g
  /home/vagrant/.vim/bundle/neobundle.vim/bin/neoinstall
  EOH
end
