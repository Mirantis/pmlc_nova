# == Class: pmlc_nova
#
# Class to setup and manage nova
#
# === Authors
#
# Scott Brimhall <sbrimhall@mirantis.com>
#
# === Copyright
#
# Copyright 2015 Mirantis Inc, unless otherwise noted.
#
class pmlc_nova (
  $debug                     = $::pmlc_nova::params::debug,
  $management_vip            = $::pmlc_nova::params::management_vip,
  $nova_config               = $::pmlc_nova::params::nova_config,
  $cpu_allocation_ratio      = $::pmlc_nova::params::cpu_allocation_ratio,
  $ram_allocation_ratio      = $::pmlc_nova::params::ram_allocation_ratio,
  $disk_allocation_ratio     = $::pmlc_nova::params::disk_allocation_ratio,
  $rabbit_pass               = $::pmlc_nova::params::rabbit_pass,
  $rabbit_user               = $::pmlc_nova::params::rabbit_user,
  $neutron_admin_pass        = $::pmlc_nova::params::neutron_admin_pass,
  $default_floating_pool     = $::pmlc_nova::params::default_floating_pool,
  $neutron_admin_user        = $::pmlc_nova::params::neutron_admin_user,
  $nova_database_user        = $::pmlc_nova::params::nova_database_user,
  $nova_database_password    = $::pmlc_nova::params::nova_database_password,
  $nova_admin_password       = $::pmlc_nova::params::nova_admin_password,
  $nova_admin_user           = $::pmlc_nova::params::nova_admin_user,
  $neutron_admin_tenant_name = $::pmlc_nova::params::neutron_admin_tenant_name,
  $nova_conductor_workers    = $::pmlc_nova::params::nova_conductor_workers,
  $role                      = undef,
  $use_ceph                  = $::pmlc_nova::params::use_ceph,
  $live_migration_flag       = $::pmlc_nova::params::live_migration_flag,
  $images_rbd_pool           = $::pmlc_nova::params::images_rbd_pool,
  $images_type               = $::pmlc_nova::params::images_type,
  $rbd_user                  = $::pmlc_nova::params::rbd_user,
) inherits pmlc_nova::params {

  validate_bool($debug)
  validate_string($management_vip)
  validate_string($nova_config)
  validate_string($cpu_allocation_ratio)
  validate_string($ram_allocation_ratio)
  validate_string($disk_allocation_ratio)
  validate_string($rabbit_pass)
  validate_string($rabbit_user)
  validate_string($neutron_admin_pass)
  validate_string($default_floating_pool)
  validate_string($neutron_admin_user)
  validate_string($nova_database_password)
  validate_string($nova_admin_password)
  validate_string($nova_admin_user)
  validate_string($neutron_admin_tenant_name)
  validate_string($nova_conductor_workers)
  validate_string($role)
  validate_bool($use_ceph)

  if $use_ceph == true {
    validate_string($live_migration_flag)
    validate_string($imaged_rbd_pool)
    validate_string($images_type)
    validate_string($rbd_user)
  }

  $my_class = $role ? {
    'controller' => '::pmlc_nova::controller',
    'compute'    => '::pmlc_nova::compute',
  }

  include $my_class

}
