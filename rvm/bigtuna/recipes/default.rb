include_recipe "rvm"

user node[:bigtuna][:user] do
  action :create
  system "true"
  home node[:bigtuna][:data_dir]
  shell "/bin/bash"
end

bash "install bundler" do
  user "root"
  code <<-EOH
    gem install bundler
  EOH
end

directory "#{node[:bigtuna][:data_dir]}" do
  owner node[:bigtuna][:user]
  group node[:bigtuna][:user]
  mode "0755"
end

directory "#{node[:bigtuna][:data_dir]}/shared" do
  owner node[:bigtuna][:user]
  group node[:bigtuna][:user]
  mode "0755"
end

directory node[:bigtuna][:run_dir] do
  mode 0755
  owner node[:bigtuna][:user]
  group node[:bigtuna][:user]
end

file "#{node[:bigtuna][:run_dir]}/production.pid" do
  owner node[:bigtuna][:user]
  group node[:bigtuna][:user]
  mode 0644
end

file "#{node[:bigtuna][:run_dir]}/secure_production.pid" do
  owner node[:bigtuna][:user]
  group node[:bigtuna][:user]
  mode 0644
end

directory node[:bigtuna][:log_dir] do
  owner node[:bigtuna][:user]
  group node[:bigtuna][:user]
  mode 0755
end

file "#{node[:bigtuna][:log_dir]}/production.log" do
  owner node[:bigtuna][:user]
  group node[:bigtuna][:user]
  mode 0644
end

file "#{node[:bigtuna][:log_dir]}/secure_production.log" do
  owner node[:bigtuna][:user]
  group node[:bigtuna][:user]
  mode 0644
end

deploy_revision node[:bigtuna][:data_dir] do
  repo "git://github.com/ubilabs/bigtuna.git"
  branch "ubilabs-production"
  shallow_clone true
  restart_command "touch tmp/restart.txt"
  symlinks Hash.new
  symlink_before_migrate Hash.new
  user node[:bigtuna][:user]
  group node[:bigtuna][:user]
  before_symlink do
    template "database.yml" do
      path "#{release_path}/config/database.yml"
      source "database.yml.erb"
      owner "bigtuna"
      group "bigtuna"
      mode "0644"
    end
    bash "run bundle install and migrate" do
      code <<-EOH
        cd #{release_path}
        source #{node[:rvm][:install_dir]}/scripts/rvm
        bundle install --deployment
        RAILS_ENV=production bundle exec rake db:create
        RAILS_ENV=production bundle exec rake db:migrate
      EOH
    end
  end
end

### For some stupid reason, Rails wants to have those ones, even when the path
### for the log files is configured to be somewhere else...
directory "#{node[:bigtuna][:deploy_dir]}/log" do
  owner node[:bigtuna][:user]
  group node[:bigtuna][:user]
  mode 0755
end

file "#{node[:bigtuna][:deploy_dir]}/log/production.log" do
  owner node[:bigtuna][:user]
  group node[:bigtuna][:user]
  mode 0644
end

file "#{node[:bigtuna][:deploy_dir]}/log/secure_production.log" do
  owner node[:bigtuna][:user]
  group node[:bigtuna][:user]
  mode 0644
end
###

git "#{node[:bigtuna][:data_dir]}/shared/email-config" do
  repository "git@github.com:ubilabs/intern.git"
  branch "ci-server"
  action :export
end

bash "copy email.yml into config dir" do
  user node[:bigtuna][:user]
  group node[:bigtuna][:user]
  code <<-EOH
    cp #{node[:bigtuna][:data_dir]}/shared/email-config/email.yml #{node[:bigtuna][:deploy_dir]}/config/
  EOH
end

template "bigtuna.yml" do
  path "#{node[:bigtuna][:deploy_dir]}/config/bigtuna.yml"
  source "bigtuna.yml.erb"
  owner "bigtuna"
  group "bigtuna"
  mode "0644"
end

service "bigtuna" do
  provider Chef::Provider::Service::Init
  supports :restart => true, :start => true, :stop => true
end

template "bigtuna" do
  path "/etc/init.d/bigtuna"
  source "bigtuna.erb"
  owner "root"
  group "root"
  mode "0755"
end

service "bigtuna" do
  action :restart
end
