class minecraft {
  $url = 'https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar'
  $install_dir = '/opt/minecraft'
  file {'/opt/minecraft':
    ensure => directory,
  }
  
  file {'/opt/minecraft/minecraft_server.jar':
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  package {'java':
    ensure => present,
  }
  file {"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']],
  }
}
