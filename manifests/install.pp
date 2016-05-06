class sockd::install inherits sockd {

  package { $packages:
    ensure          => $package_ensure,
    install_options => ['--allow-unauthenticated', '-f'],
  }
}
