class sockd::params {
  $service_enable    = true
  $service_ensure    = "running"
  $package_ensure    = "installed"
  $interface         = "eth0"
  $socksmethod       = "pam.username"
  $userprivileged    = "root"
  $usernotprivileged = "nobody"
  $userlibwrap       = "nobody"
  $radius_server     = "localhost"
  $shared_secret     = "testing123"
  $timeout           = "5"

  case $::operatingsystem {
    'Ubuntu': {
      case $::operatingsystemrelease {
        '14.04': {
          $packages     = [ "libwrap0", "libpam-radius-auth", "sockd" ]
          $service_name = "sockd"
        }
        default: {
          fail("Unsupported version: ${::operatingsystem}/${$::operatingsystemrelease}")
        }
      }
    }
    default: {
      fail("Unsupported platform: ${::osfamily}/${::operatingsystem}/${$::operatingsystemrelease}")
    }
  }
}
