class rvm::helpers {
  exec { 'rvm-cleanup':
    command     => '/usr/local/rvm/bin/rvm cleanup sources',
    refreshonly => 'true',
  }

  exec { 'upgrade-rvm':
    command     => '/usr/local/rvm/bin/rvm update ; /usr/local/rvm/bin/rvm reload',
    refreshonly => 'true',
  }
}
