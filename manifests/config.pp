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
}
