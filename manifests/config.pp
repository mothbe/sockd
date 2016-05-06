class sockd::config inherits sockd {

  file { "/etc/sockd.conf":
    ensure  => present,
    content => template("sockd/sockd.conf.erb"),
    mode    => "0640",
  }

  file { "/etc/pam_radius_auth.conf":
    ensure  => present,
    content => template("sockd/pam_radius_auth.conf.erb"),
    mode    => "0600",
  }
}

