maintainer "Ubilabs GmbH"
maintainer_email "trainer@ubilabs.net"
license "Apache 2.0"
description "configures the apn_sender init script"
version "0.1"
recipe "apn_sender", "custom apn_sender init config"
recipe "apn_sender::deploy", "update apn_sender when deploying"

supports "ubuntu"
