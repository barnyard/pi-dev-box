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

exec { 'ant-contrib linking':
  command => 'ln -s  ../../java/ant-contrib.jar ant-contrib.jar',
  cwd => '/usr/share/ant/lib',
  creates => '/usr/share/ant/lib/ant-contrib.jar'
}

exec { 'create workspace':
  command => 'mkdir -p /home/vagrant/workspace',
  creates => '/home/vagrant/workspace'
}

# --- Pi source ---------------------------------------------------------------

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

exec { 'clone p2p-networkmanager source':
  command => "git clone https://github.com/barnyard/p2p-networkmanager.git",
  cwd => '/home/vagrant/workspace',
  creates => '/home/vagrant/workspace/p2p-networkmanager'
}

exec { 'clone p2p-instancemanager source':
  command => "git clone https://github.com/barnyard/p2p-instancemanager.git",
  cwd => '/home/vagrant/workspace',
  creates => '/home/vagrant/workspace/p2p-instancemanager'
}

exec { 'clone pi-sss source':
  command => "git clone https://github.com/barnyard/pi-sss.git",
  cwd => '/home/vagrant/workspace',
  creates => '/home/vagrant/workspace/pi-sss'
}

exec { 'clone p2p-imagemanager source':
  command => "git clone https://github.com/barnyard/p2p-imagemanager.git",
  cwd => '/home/vagrant/workspace',
  creates => '/home/vagrant/workspace/p2p-imagemanager'
}

exec { 'clone p2p-volumemanager source':
  command => "git clone https://github.com/barnyard/p2p-volumemanager.git",
  cwd => '/home/vagrant/workspace',
  creates => '/home/vagrant/workspace/p2p-volumemanager'
}

exec { 'clone p2p-api source':
  command => "git clone https://github.com/barnyard/p2p-api.git",
  cwd => '/home/vagrant/workspace',
  creates => '/home/vagrant/workspace/p2p-api'
}

exec { 'clone p2p-integration source':
  command => "git clone https://github.com/barnyard/p2p-integration.git",
  cwd => '/home/vagrant/workspace',
  creates => '/home/vagrant/workspace/p2p-integration'
}

exec { 'clone pi-ops-website source':
  command => "git clone https://github.com/barnyard/pi-ops-website.git",
  cwd => '/home/vagrant/workspace',
  creates => '/home/vagrant/workspace/pi-ops-website'
}

exec { 'clone p2p-demo source':
  command => "git clone https://github.com/barnyard/p2p-demo.git",
  cwd => '/home/vagrant/workspace',
  creates => '/home/vagrant/workspace/p2p-demo'
}

exec { 'permissions':
  command => "chown vagrant: -R /home/vagrant/workspace"
}

