maintainer "Ubilabs GmbH"
maintainer_email "trainer@ubilabs.net"
license "Apache 2.0"
description "configures the resque-pool init script"
version "0.1"
recipe "resque-pool", "custom resque-pool init config"
recipe "resque-pool::deploy", "updates resque-pool when deploying"

supports "ubuntu"
