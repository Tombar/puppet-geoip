# = Class: geoip::common
#
# GeoIP configuration used by other classes.
#
class geoip inherits geoip::params {
 
  package { $geoip::params::package: ensure => installed }

  class {'geoip::conf':
    require => Package[$geoip::params::package]
  }

  if ($geoip::params::update_cron) {

    file{'/etc/cron.weekly/geoip-update':
        ensure => present,
        source => 'puppet:///geoip/geoipupdate.cron'
    }

  }

}

