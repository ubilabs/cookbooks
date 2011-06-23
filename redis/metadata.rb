maintainer "Ubilabs GmbH"
maintainer_email "koelle@ubilabs.net"
license "Commercial"
description "Installs and configures redis server only"
version "0.1"
recipe "redis::server", "Installs redis server for ubuntu"
recipe "redis::configure", "Custom redis server config"

supports "ubuntu"

