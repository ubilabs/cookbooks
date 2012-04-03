# install the gems for backup
gem_package "fog" do
  version "1.3.1"
  action :install
end

gem_package "backup" do
  action :install
end

# copy our config file to backup config dir
template node[:backup][:config_file] do
  source "backup.html.erb"
  mode 0644
  owner "root"
  group "root"
end

# create cron for mysql-backup task
cron "backup db to s3" do
  hour node[:backup][:cron][:hour].to_s
  minute node[:backup][:cron][:minute].to_s
  command "/usr/local/bin/backup perform --trigger #{node[:backup][:database]} --config_file '#{node[:backup][:config_file]}'"
end
