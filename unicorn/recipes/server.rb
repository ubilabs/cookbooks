user "redis" do
  shell "/bin/bash"
end

directory node[:redis][:datadir] do 
  owner node[:redis][:user]
  group 'users'
  mode '0751'
end

service "redis-server" do
  service_name "redis-server"
  supports :status => false, :restart => true, :stop => true, "force-reload" => true
  action :enable
end

template "/etc/redis/redis.conf" do
  source "redis.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => "redis-server"), :immediately
end

