default[:redis] = {}
default[:redis][:bind_address] = '0.0.0.0'
default[:redis][:port] = 6379
default[:redis][:timeout] = 0
default[:redis][:version] = '2.4.12'
default[:redis][:cli][:version] = redis[:version]
default[:redis][:prefix] = '/usr/local'
default[:redis][:user] = 'redis'
default[:redis][:datadir] = '/var/lib/redis'
default[:redis][:log_level] = 'notice'
default[:redis][:log_file] = '/var/log/redis/redis.log'
default[:redis][:pid_file] = '/var/run/redis.pid'
default[:redis][:dump_file] = 'dump.rdb'
default[:redis][:appendonly] = 'yes'
default[:redis][:aofile] = 'appendonly.aof'
default[:redis][:appendfsync] = 'everysec'
default[:redis][:no_appendfsync_on_rewrite] = 'no'
default[:redis][:auto_aof_rewrite_percentage] = '150'
default[:redis][:auto_aof_rewrite_min_size] = '512mb'

# deprecated VM
default[:redis][:vm] = 'no'
default[:redis][:vm_max_memory] = '3558759680'
default[:redis][:vm_page_size] = '32'
default[:redis][:vm_pages] = '268435456'
default[:redis][:swapfile] = '/mnt/redis/redis.swap'

# backup & compaction
default[:redis][:compact_every_x_days] = "*/1"
default[:redis][:compact_at] = '3'
default[:redis][:backup_hour] = "0-23/4"
default[:redis][:backup_minute] = '30'
default[:redis][:backupdir] = '/vol/backups/redis'
default[:redis][:backup_backlog] = 10
