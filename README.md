# sockd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with sockd](#setup)
    * [What sockd affects](#what-sockd-affects)
    * [Beginning with sockd](#beginning-with-sockd)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

This modules is used to install and configure sockd (dante) daemon.
sockd package is installed from custom repository on puppet master.

## Module Description

This module managed configuration of sockd.
This modules:
 - install sockd, libwrap0, libpam-radius-auth 
 - modifies settings in files:  /etc/sockd.conf

## Setup

### What sockd affects

* A list of files managed via module: /etc/sockd.conf, /etc/pam_radius_auth.conf
* A list of packages managed via module: sockd, libwrap0, libpam-radius-auth
* A list of services managed via module: sockd

### Beginning with sockd

class { "sockd": }

## Usage

class { "sockd":
  $service_enable    => true
  $service_ensure    => "running"
  $package_ensure    => "installed"
  $interface         => "eth0"
  $socksmethod       => "pam.username"
  $userprivileged    => "root"
  $usernotprivileged => "nobody"
  $userlibwrap       => "nobody"
  $radius_server     => "localhost"
  $shared_secret     => "testing123"
  $timeout           => "5"
}

## Limitations

This module supports only Ubuntu 14.04.

