include_recipe "rails"
include_recipe "nginx::service"
include_recipe "unicorn"

node[:deploy].each do |application, deploy|

  Chef::Log.debug(application.inspect)
  Chef::Log.debug(deploy.inspect)

  scalarium_deploy_user do
    deploy_data deploy
  end

  scalarium_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  scalarium_rails do
    deploy_data deploy
    app application
  end

  scalarium_deploy do
    deploy_data deploy
    app application
  end

  template "#{deploy[:release_path]}/config/unicorn.rb" do
    source "unicorn.rb.erb"
    owner "root"
    group "root"
    mode "0644"
    variables(:application => application)

    notifies :reload, resources(:service => "unicorn_#{application}")
  end

  template "/etc/monit/conf.d/unicorn_#{application}.monitrc" do
    source "unicorn.monit.erb"
    owner "root"
    group "root"
    mode "0644"
    variables(:application => application)
  end

  template "#{node[:nginx][:dir]}/sites-available/#{application}" do
    source "site.erb"
    cookbook "nginx"
    owner "root"
    group "root"
    mode 0644
    variables :application => deploy

    notifies :reload, resources(:service => "nginx")
  end

  # delete default virtual host
  file "#{node[:nginx][:dir]}/sites-enabled/default" do
    action :delete
  end

  nginx_site application


  bash "compress the assets" do
    user "deploy"
    code <<-EOH
      cd #{deploy[:release_path]} && bundle exec rake sass:update &&  bundle exec rake jammit:after_deploy
    EOH
  end


  execute "monit reload" do
    action :run
  end

end
