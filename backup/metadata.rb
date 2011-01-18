maintainer       "Ubilabs GmbH"
maintainer_email "mueller@ubilabs.net"
license          "Apache 2.0"
description      "Installs Backup Gem and do all the configuration to send to s3. Automated by cron"
version          "0.1"
recipe           "backup::install"
recipe           "backup::configure"

supports 'ubuntu'
