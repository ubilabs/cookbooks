default[:xtrabackup][:version] = '1.6'
default[:xtrabackup][:target_dir] = '/vol/backups/mysql'
default[:xtrabackup][:executable] = "/opt/local/bin/db-backup"
default[:xtrabackup][:keep] = 30
default[:xtrabackup][:schedule] = ''
default[:xtrabackup][:deb] = 'xtrabackup_1.6.2-274.lucid_i386.deb'
