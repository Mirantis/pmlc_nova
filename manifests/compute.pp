# == Class: pmlc_nova::compute
#
# Class to setup and manage nova compute
#
# === Authors
#
# Scott Brimhall <sbrimhall@mirantis.com>
#
# === Copyright
#
# Copyright 2015 Mirantis inc, unless otherwise noted.
#
class pmlc_nova::compute {

  include ::pmlc_nova::compute::install
  include ::pmlc_nova::compute::config
  include ::pmlc_nova::compute::service

  # Order classes
  Class['::pmlc_nova::compute::install'] ->
  Class['::pmlc_nova::compute::config'] ->
  Class['::pmlc_nova::compute::service']

}
