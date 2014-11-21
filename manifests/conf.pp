# = Class: geoip::conf
#
# This class configures GeoIP.conf with your credentials provided by MaxMind,
# in order to have the `geoipupdate` program automatically download and
# install the latest GeoIP databases.
#
# == Parameters
#
# [* userid *]
#   UserId provided by MaxMind for your account.
#   Default: none
# [* licensekey *]
#   LicenseKey provided by MaxMind for your account.
#   Default: none
# [* productids *]
#   String list of Product Ids geoipupdate should download.
#   Default: 106
#
# == Examples
#
#     class { 'geoip::conf':
#       userid     => '12345',
#       licensekey => 'abcdefghijklmnop',
#       productids => '106 133',
#     }
#
# == Author
#
# Based on Matthias Saou <matthias@saou.eu> https://github.com/thias/puppet-geoip
#
class geoip::conf (
  $owner      = 'root',
  $group      = 'root',
  # We typically do not want anyone to see the LicenseKey
  $mode       = '0600',
  $userid     = $geoip::params::userid,
  $licensekey = $geoip::params::licensekey,
  #106 == GeoIP Country
  #132 == GeoIP City
  $productids = $geoip::params::productids,
  $ensure     = 'present'
) {

  #TODO: assert userid and licensekey

  file { '/etc/GeoIP.conf':
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => template('geoip/GeoIP.conf.erb'),
    ensure  => $ensure,
  }

}

