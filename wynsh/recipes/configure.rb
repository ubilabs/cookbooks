template "#{node[:nginx][:wynsh_config]}" do
  source "nginx-wynsh.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end

