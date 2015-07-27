# == Class: pmlc_nova::controller::install
#
# Install nova packages
#
# Scott Brimhall [sbrimhall@mirantis.com]
#
# === Copyright
#
# Copyright 2015 Mirantis Inc, unless otherwise noted.
#
class pmlc_nova::controller::install {

  $packages = [
    'nova-api',
    'nova-cert',
    'nova-common',
    'nova-conductor',
    'nova-consoleauth',
    'nova-novncproxy',
    'nova-objectstore',
    'nova-scheduler',
    'python-nova',
    'python-novaclient',
  ]

  package { $packages:
    ensure => 'present',
  }

}
