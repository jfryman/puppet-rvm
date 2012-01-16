class rvm::config {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0755',
  }

  file { '/etc/gemrc':
    mode   => '0444',
    source => 'puppet:///modules/rvm/etc/gemrc',
  }

  file { '/etc/profile.d/rvm.sh':
    source => 'puppet:///modules/rvm/etc/profile.d/rvm.sh',
  }

  exec { 'rvm-cleanup':
    command     => '/usr/local/rvm/bin/rvm cleanup sources',
    refreshonly => 'true',
  }

  exec { 'upgrade-rvm':
    command    => '/usr/local/rvm/bin/rvm update ; /usr/local/rvm/bin/rvm reload',
    refreshony => 'true',
  }
}
