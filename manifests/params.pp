# Params class
class pmlc_nova::params {
  $management_vip            = undef
  $debug                     = False
  $nova_config               = '/etc/nova/nova.conf'
  $cpu_allocation_ratio      = '8.0'
  $ram_allocation_ratio      = '1.0'
  $disk_allocation_ratio     = '1.0'
  $rabbit_pass               = 'rabbit'
  $rabbit_user               = 'nova'
  $neutron_admin_pass        = 'neutron'
  $default_floating_pool     = 'net04_ext'
  $neutron_admin_user        = 'neutron'
  $nova_database_user        = 'nova'
  $nova_database_password    = 'nova'
  $nova_admin_password       = 'nova'
  $nova_admin_user           = 'nova'
  $neutron_admin_tenant_name = 'services'
  $nova_conductor_workers    = '2'
  $use_ceph                  = true
  $live_migration_flag       = $::pmlc::use_ceph ? {
    true  => 'VIR_MIGRATE_UNDEFINE_SOURCE,VIR_MIGRATE_PEER2PEER,VIR_MIGRATE_LIVE,VIR_MIGRATE_PERSIST_DEST',
    false => 'VIR_MIGRATE_UNDEFINE_SOURCE,VIR_MIGRATE_PEER2PEER,VIR_MIGRATE_PERSIST_DEST',
  }
  $images_rbd_pool           = 'compute'
  $images_type               = $::pmlc::use_ceph ? {
    true  => 'rbd',
    false => 'default',
  }
  $rbd_user                  = 'compute'
}
