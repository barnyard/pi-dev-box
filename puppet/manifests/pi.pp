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

# --- Pi source ---------------------------------------------------------------

exec { 'create workspace':
  command => "mkdir -p /home/vagrant/workspace"
}

exec { 'clone p2p-build source':
  command => "git clone https://github.com/barnyard/p2p-build.git",
  cwd => '/home/vagrant/workspace',
  creates => '/home/vagrant/workspace/p2p-build'
}

exec { 'clone freepastry source':
  command => "git clone https://github.com/barnyard/freepastry.git",
  cwd => '/home/vagrant/workspace',
  creates => '/home/vagrant/workspace/freepastry'
}

exec { 'clone p2p-core source':
  command => "git clone https://github.com/barnyard/p2p-core.git",
  cwd => '/home/vagrant/workspace',
  creates => '/home/vagrant/workspace/p2p-core'
}

exec { 'clone p2p-app source':
  command => "git clone https://github.com/barnyard/p2p-app.git",
  cwd => '/home/vagrant/workspace',
  creates => '/home/vagrant/workspace/p2p-app'
}

exec { 'permissions':
  command => "chown vagrant: -R /home/vagrant/workspace"
}

