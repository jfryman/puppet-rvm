class rvm::packages {
  anchor { 'rvm::packages::begin': }
  anchor { 'rvm::packages::end': }
  
  case $::operatingsystem {
    redhat,oel,centos,fedora: {
      class { 'rvm::packages::redhat':
        require => Anchor['rvm::packages::begin'],
        before  => Class['rvm::packages::common'],
      }
    }
  }
  
  class { 'rvm::packages::common':
    before  => Anchor['rvm::packages::end'],
  }
}