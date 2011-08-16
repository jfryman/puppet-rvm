class rvm::config {
  file { '/etc/gemrc':
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    source => 'puppet:///modules/rvm/etc/gemrc',
  }
}
