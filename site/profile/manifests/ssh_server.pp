class profile::ssh_server {
      package {'openssh-server':
              ensure => present,
      }
      service {'sshd':
              ensure => 'running',
              enable => 'true',
              }
      ssh_authorized_key {'root@master.puppet.vm':
              ensure => present,
              user => 'root',
              type => 'ssh-rsa',
              key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDA2683vtN1dO2QAvohBkuY+WWF7+cX6tprlLsGSbA/b08Kz/Go1wyWSBlQKiWKTnA+1BFbWT6MM2uilGKf33x53V8EGJ6XDE0lFmKBP+SoJOfy3p+PVxGTP+E86Nmr8RBmhBCXE6VQGI39ZIKfIPHTjiplV58u+AGfA/SD1cMLAtVTEcn+FtWq+sLAbFL5lTRa46ifSv7bvy7vOCuu/du0P2nq3jypyRbO7Zu1MzhL/0Gw1WduNCE0iDqFpGNsQkW1CdJBhFO6pyBXrXSVYqB7wA3LKwPrORwe8rq8fNACyCTOXLfS01isPsvEjjcGl4HPgEos3kpP2M2AbvnKUXZT root@master.puppet.vm'
              }
}
