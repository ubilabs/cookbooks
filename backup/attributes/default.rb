default[:backup]                              = {}
default[:backup][:config_file]                = "/opt/backup/config/backup.rb"
default[:backup][:amazon][:access_key]        = "123456789"
default[:backup][:amazon][:secret_access_key] = "1234567890123456789"
default[:backup][:amazon][:bucket]            = "/bucket/bucket_name"
default[:backup][:cron][:hour]     = "1"
default[:backup][:cron][:minute]   = "0"
default[:backup][:keep_backups]               = "10"
