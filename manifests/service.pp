class sockd::service inherits sockd {

  service { $service_name:
    ensure => $service_ensure,
    enable => $service_enable,
    status => "test -f /var/run/sockd.pid",
  }
}

