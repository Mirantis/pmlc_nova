# == Class: pmlc_nova::compute::install
#
# Install nova packages
#
# Scott Brimhall [sbrimhall@mirantis.com]
#
# === Copyright
#
# Copyright 2015 Mirantis Inc, unless otherwise noted.
#
class pmlc_nova::compute::install {

  $packages = [
    'nova-common',
    'nova-compute',
    'nova-compute-libvirt',
    'nova-compute-qemu',
    'python-nova',
    'python-novaclient'
  ]

  package { $packages:
    ensure => 'present',
  }

}
