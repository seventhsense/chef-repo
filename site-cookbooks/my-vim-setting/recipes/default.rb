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

%w[backup undo yankring_history].each do |directory_name|
  path = "/home/vagrant/.vim/" + directory_name
  directory path do
    owner "vagrant"
    group "vagrant"
    action :create
  end
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

link "/home/vagrant/.vim/snippets" do
  to "/home/vagrant/dot-vim-files/snippets"
  owner "vagrant"
  group "vagrant"
end

link "/home/vagrant/.vim/dict" do
  to "/home/vagrant/dot-vim-files/dict"
  owner "vagrant"
  group "vagrant"
end

script "neobundleinstall" do
  interpreter "bash"
  user "vagrant"
  cwd "/home/vagrant"
  code <<-EOH
  # sh /home/vagrant/.vim/bundle/neobundle.vim/bin/neoinstall
  # vim +" :NeoBundleInstall" +:q
  vim -u ~/.vimrc -i NONE -c "try | NeoBundleInstall | finally | q! | endtry" -e -s -V1
  # sudo reboot
  EOH
  returns [0, 1]
end
