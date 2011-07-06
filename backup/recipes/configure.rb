template node[:backup][:config_file] do
  source "backup.html.erb"
  mode 0644
  owner "root"
  group "root"
end
