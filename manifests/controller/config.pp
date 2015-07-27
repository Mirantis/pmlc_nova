# == Class: pmlc_nova::controller::config
#
# Class to manage nova configuration file
#
# === Authors
#
# Scott Brimhall <sbrimhall@mirantis.com>
#
# === Copyright
#
# Copyright 2015 Mirantis Inc, unless otherwise noted.
#
class pmlc_nova::controller::config (
  $debug                     = $::pmlc_nova::debug,
  $nova_config               = $::pmlc_nova::nova_config,
  $management_vip            = $::pmlc_nova::management_vip,
  $cpu_allocation_ratio      = $::pmlc_nova::cpu_allocation_ratio,
  $ram_allocation_ratio      = $::pmlc_nova::ram_allocation_ratio,
  $disk_allocation_ratio     = $::pmlc_nova::disk_allocation_ratio,
  $rabbit_pass               = $::pmlc_nova::rabbit_pass,
  $rabbit_user               = $::pmlc_nova::rabbit_user,
  $neutron_admin_pass        = $::pmlc_nova::neutron_admin_pass,
  $default_floating_pool     = $::pmlc_nova::default_floating_pool,
  $neutron_admin_user        = $::pmlc_nova::neutron_admin_user,
  $nova_database_user        = $::pmlc_nova::nova_database_user,
  $nova_database_password    = $::pmlc_nova::nova_database_password,
  $nova_admin_password       = $::pmlc_nova::nova_admin_password,
  $nova_admin_user           = $::pmlc_nova::nova_admin_user,
  $neutron_admin_tenant_name = $::pmlc_nova::neutron_admin_tenant_name,
  $nova_conductor_workers    = $::pmlc_nova::nova_conductor_workers,
) inherits ::pmlc_nova {

  # Enable debug logging
  ini_setting { 'Nova debug logging':
    ensure  => present,
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'debug',
    value   => $debug,
  }

  # Set the cpu allocation ratio for nova scheduler
  ini_setting { 'CPU allocation ratio':
    ensure  => 'present',
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'cpu_allocation_ratio',
    value   => $cpu_allocation_ratio,
  }

  # Set the rabbit password for use with nova
  ini_setting { 'Nova RabbitMQ password':
    ensure  => 'present',
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'rabbit_password',
    value   => $rabbit_pass,
  }

  # Set the rabbit user for nova service
  ini_setting { 'Nova RabbitMQ user':
    ensure  => 'present',
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'rabbit_userid',
    value   => $rabbit_user,
  }

  # Password for neutron admin api calls
  ini_setting { 'Nova neutron admin pass':
    ensure  => 'present',
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'neutron_admin_password',
    value   => $neutron_admin_pass,
  }

  # Neutron admin api user
  ini_setting { 'Nova neutron admin user':
    ensure  => 'present',
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'neutron_admin_username',
    value   => $neutron_admin_user,
  }

  # Default floating ip pool network
  ini_setting { 'Default floating pool':
    ensure  => 'present',
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'default_floating_pool',
    value   => $default_floating_pool,
  }

  # Nova DB connection
  ini_setting { 'Nova DB connection':
    ensure  => 'present',
    path    => $nova_config,
    section => 'database',
    setting => 'connection',
    value   => "mysql://${nova_database_user}:${nova_database_password}@${management_vip}/nova?read_timeout=60",
  }

  # Tenant name to use for neutron admin user
  ini_setting { 'Neutron tenant name':
    ensure  => 'present',
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'neutron_admin_tenant_name',
    value   => $neutron_admin_tenant_name,
  }

  # Nova conductor workers
  ini_setting { 'Nova conductor workers':
    ensure  => 'present',
    path    => $nova_config,
    section => 'conductor',
    setting => 'workers',
    value   => $nova_conductor_workers,
  }

  ini_setting { 'Nova admin password':
    ensure  => 'present',
    path    => $nova_config,
    section => 'keystone_authtoken',
    setting => 'admin_password',
    value   => $nova_admin_password,
  }

  ini_setting { 'Nova admin user':
    ensure  => 'present',
    path    => $nova_config,
    section => 'keystone_authtoken',
    setting => 'admin_user',
    value   => $nova_admin_user,
  }
}
