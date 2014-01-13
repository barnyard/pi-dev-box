Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin']
}

# --- Preinstall Stage ---------------------------------------------------------

stage { 'preinstall':
  before => Stage['main']
}

class apt_get_update {
  exec { 'apt-get -y update':
  }
}

class { 'apt_get_update':
  stage => preinstall
}

# --- Developement dependencies -----------------------------------------------

package { ['git', 'openjdk-7-jdk', 'ant', 'ant-contrib']:
  ensure => installed
}
