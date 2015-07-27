# == Class: pmlc_nova::compute::service
#
# Class to configure nova services on compute
#
# === Authors
#
# Scott Brimhall <sbrimhall@mirantis.com>
#
# === Copyright
#
# Copyright 2015 Mirantis Inc, unless otherwise noted.
#
class pmlc_nova::compute::service {

  $service = [
    'nova-compute'
  ]

  $config_lines = [
    'Nova debug logging',
    'nova RabbitMQ password',
    'nova RabbitMQ user',
    'nova neutron admin pass',
    'nova neutron admin user',
    'nova DB connection',
    'neutron tenant name',
    'live migration flag',
    'images rbd pool',
    'images type',
    'rbd user'
  ]

  service { $service:
    ensure    => 'running',
    enable    => true,
    require   => Ini_setting[$config_lines],
    subscribe => Ini_setting[$config_lines],
  }

}
