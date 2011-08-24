default[:ebs_snapshot]                              = {}
default[:ebs_snapshot][:backup_script]              = "/usr/local/bin/ebs_snaphot"
default[:ebs_snapshot][:amazon][:access_key_id]     = "123456789"
default[:ebs_snapshot][:amazon][:secret_access_key] = "1234567890123456789"
default[:ebs_snapshot][:amazon][:region]            = "eu-west-1"
default[:ebs_snapshot][:cron][:hours]               = "*"
default[:ebs_snapshot][:cron][:minutes]             = "*/20"
default[:ebs_snapshot][:num_snapshots_to_keep]      = 200
