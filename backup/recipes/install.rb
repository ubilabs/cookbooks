# install the gems for backup
gem_package "backup" do
  action :install
end

# bootstrap the backup gem
execute "backup --setup" do
  command "backup --setup"
  action :run
end

# delete generated config file
file node[:backup][:config_file] do
  action :delete
end

# copy our config file to backup config dir
template node[:backup][:config_file] do
  source "backup.rb.erb"
end


# create cron for mysql-backup task
cron "backup --run mysql-backup-s3" do
  hour node[:backup][:database][:cron][:hour]
  minute node[:backup][:database][:cron][:minute]
  user "root"
  command "backup --run mysql-backup-s3"
end

# create cron for file-backup-task
cron "backup --run file-backup-s3" do
  hour node[:backup][:files][:cron][:hour]
  minute node[:backup][:files][:cron][:minute]
  user "root"
  command "backup --run file-backup-s3"
end

