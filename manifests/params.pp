class geoip::params {

  $package    = hiera('geoip::package', 'geoip-bin')
  $userid     = hiera('geoip::userid', '')
  $licensekey = hiera('geoip::licensekey', '')
  $productids = hiera('geoip::products', '106 132')

  $update_cron = hiera('geoip::update_cron', true)
}