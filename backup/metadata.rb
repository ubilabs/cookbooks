maintainer       "Ubilabs GmbH"
maintainer_email "mueller@ubilabs.net"
license          "Apache 2.0"
description      "Installs Backup Gem and Whenever Gem and do all the configuration to send to s3."
version          "0.1"
recipe           "backup::install"
recipe           "backup::configure"

supports 'ubuntu'
