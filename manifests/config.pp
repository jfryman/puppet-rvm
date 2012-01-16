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

  file { '/usr/local/bin/rvm_set_system_ruby':
    ensure => file,
    mode   => '0700',
    source => 'puppet:///modules/rvm/bin/rvm_set_system_ruby',
  }

  file { '/etc/profile.d/rvm.sh':
    source => 'puppet:///modules/rvm/etc/profile.d/rvm.sh',
  }
}
