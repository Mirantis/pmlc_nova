# == Class: pmlc_nova::compute::config
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
class pmlc_nova::compute::config (
  $debug                     = $::pmlc_nova::debug,
  $management_vip            = $::pmlc_nova::management_vip,
  $nova_config               = $::pmlc_nova::nova_config,
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
  $neutron_admin_tenant_name = $::pmlc_nova::neutron_admin_tenant_name,
  $nova_conductor_workers    = $::pmlc_nova::nova_conductor_workers,
  $live_migration_flag       = $::pmlc_nova::live_migration_flag,
  $images_rbd_pool           = $::pmlc_nova::images_rbd_pool,
  $images_type               = $::pmlc_nova::images_type,
  $rbd_user                  = $::pmlc_nova::rbd_user,
) inherits ::pmlc_nova {

  # Enable debug logging
  ini_setting { 'Nova debug logging':
    ensure  => 'present',
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'debug',
    value   => $debug,
  }

  # Set the rabbit password for use with nova
  ini_setting { 'nova RabbitMQ password':
    ensure  => 'present',
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'rabbit_password',
    value   => $rabbit_pass,
  }

  # Set the rabbit user for nova service
  ini_setting { 'nova rabbitMQ user':
    ensure  => 'present',
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'rabbit_userid',
    value   => $rabbit_user,
  }

  # Password for neutron admin api calls
  ini_setting { 'nova neutron admin pass':
    ensure  => 'present',
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'neutron_admin_password',
    value   => $neutron_admin_pass,
  }

  # Neutron admin api user
  ini_setting { 'nova neutron admin user':
    ensure  => 'present',
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'neutron_admin_user',
    value   => $neutron_admin_user
  }

  # Nova DB connection
  ini_setting { 'nova DB connection':
    ensure  => 'present',
    path    => $nova_config,
    section => 'database',
    setting => 'connection',
    value   => "connection=mysql://${nova_database_user}:${nova_database_password}@${management_vip}/nova?read_timeout=60",
  }

  # Tenant name to use for neutron admin user
  ini_setting { 'neutron tenant name':
    ensure  => 'present',
    path    => $nova_config,
    section => 'DEFAULT',
    setting => 'neutron_admin_tenant_name',
    value   => $neutron_admin_tenant_name,
  }

  # libvirt settings
  ini_setting { 'live migration flag':
    ensure  => 'present',
    path    => $nova_config,
    section => 'libvirt',
    setting => 'live_migration_flag',
    value   => $live_migration_flag,
  }

  ini_setting { 'images rbd pool':
    ensure  => 'present',
    path    => $nova_config,
    section => 'libvirt',
    setting => 'images_rbd_pool',
    value   => $images_rbd_pool,
  }

  ini_setting { 'images type':
    ensure  => 'present',
    path    => $nova_config,
    section => 'libvirt',
    setting => 'images_type',
    value   => $images_type,
  }

  ini_setting { 'rbd user':
    ensure  => 'present',
    path    => $nova_config,
    section => 'libvirt',
    setting => 'rbd_user',
    value   => $rbd_user,
  }
}
