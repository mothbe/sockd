class sockd (
  $service_enable    = $sockd::params::service_enable,
  $service_ensure    = $sockd::params::service_ensure,
  $package_ensure    = $sockd::params::package_ensure,
  $interface         = $sockd::params::interface,
  $socksmethod       = $sockd::params::socksmethod,
  $userprivileged    = $sockd::params::userprivileged,
  $usernotprivileged = $sockd::params::usernotprivileged,
  $userlibwrap       = $sockd::params::userlibwrap,
  $radius_server     = $sockd::params::radius_server,
  $shared_secret     = $sockd::params::shared_secret,
  $timeout           = $sockd::params::timeout,
) inherits sockd::params {

  contain sockd::install
  contain sockd::config
  contain sockd::service

  Class['sockd::install'] ->
  Class['sockd::config'] ~>
  Class['sockd::service']
}
