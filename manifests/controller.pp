# == Class: pmlc_nova::controller
#
# Class to setup and manage nova controller
#
# === Authors
#
# Scott Brimhall <sbrimhall@mirantis.com>
#
# === Copyright
#
# Copyright 2015 Mirantis inc, unless otherwise noted.
#
class pmlc_nova::controller {

  include ::pmlc_nova::controller::install
  include ::pmlc_nova::controller::config
  include ::pmlc_nova::controller::service

  # Order classes
  Class['::pmlc_nova::controller::install'] ->
  Class['::pmlc_nova::controller::config'] ->
  Class['::pmlc_nova::controller::service']

}
