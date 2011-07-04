# install the gems for backup
gem_package "astrails-safe" do
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
cron "astrails-safe db and file backup" do
  hour node[:backup][:cron][:hour].to_s
  minute node[:backup][:cron][:minute].to_s
  command "astrails-safe #{node[:backup][:config_file]}"
end
