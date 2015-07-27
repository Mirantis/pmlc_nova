# == Class: pmlc_nova::controller::service
#
# Class to configure nova services on controller
#
# === Authors
#
# Scott Brimhall <sbrimhall@mirantis.com>
#
# === Copyright
#
# Copyright 2015 Mirantis Inc, unless otherwise noted.
#
class pmlc_nova::controller::service {

  $service = [
    'nova-api',
    'nova-scheduler',
    'nova-conductor',
    'nova-cert',
    'nova-consoleauth',
    'nova-novncproxy'
  ]

  $config_lines = [
    'Nova debug logging',
    'CPU allocation ratio',
    'Nova RabbitMQ password',
    'Nova RabbitMQ user',
    'Nova neutron admin pass',
    'Nova neutron admin user',
    'Default floating pool',
    'Nova DB connection',
    'Neutron tenant name',
    'Nova conductor workers',
    'Nova admin password',
    'Nova admin user',
  ]

  service { $service:
    ensure    => 'running',
    enable    => true,
    require   => Ini_setting[$config_lines],
    subscribe => Ini_setting[$config_lines],
  }

}
