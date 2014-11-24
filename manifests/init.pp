# = Class: geoip::common
#
# GeoIP configuration used by other classes.
#
class geoip inherits geoip::params {
 
  package { $geoip::params::package: ensure => installed }

  class {'geoip::conf':
    require => Package[$geoip::params::package]
  } -> exec {'run geoipupdate':
    command => '/usr/bin/geoipupdate',
    onlyif  => '/usr/bin/test -f ! /usr/share/GeoIP/GeoIPCity.dat'
  }

  if ($geoip::params::update_cron) {

    file {'/etc/cron.weekly/geoip-update':
        ensure => present,
        source => 'puppet:///modules/geoip/geoipupdate.cron'
    }

  }

}

