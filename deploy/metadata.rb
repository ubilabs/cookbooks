maintainer "Ubilabs GmbH"
maintainer_email "mueller@ubilabs.net"
description "Deploy applications"
version "0.1"
recipe "deploy::custom", "custom deployment for rails"

depends "rails"
depends "nginx::service"
depends "unicorn"
