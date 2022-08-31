node default{
  file{'/root/README':
    ensure => file,
    content => 'this is a README file',
    owner => 'root',
    }
}

node 'master.puppet.vm' {
  include role::master_server
}

node /^web/ {
  include role::app_server
}

node /^web/ {
  include role::db_server
}
