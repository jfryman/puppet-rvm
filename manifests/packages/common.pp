class rvm::packages::common {
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/rvm/bin',
  }
  
  exec { 'download-rvm-install':
    command => 'wget -O /tmp/rvm https://rvm.beginrescueend.com/install/rvm',
    creates => '/tmp/rvm',
    unless  => 'which rvm',
  }
  exec { 'install-rvm':
    command => "bash /tmp/rvm",
    creates => '/usr/local/rvm/bin/rvm',
    require => Exec['download-rvm-install'],
  }
  file { '/tmp/rvm':
    ensure  => absent,
    require => Exec['install-rvm'],
  }
}