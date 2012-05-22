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
    debian: {
      class { 'rvm::packages::debian':
        require => Anchor['rvm::packages::begin'],
        before  => Class['rvm::packages::common'],
      }
    }
    Ubuntu: {
      class { 'rvm::packages::ubuntu':
        require => Anchor['rvm::packages::begin'],
        before  => Class['rvm::packages::common'],
      }
    }
    gentoo: {
      class { 'rvm::packages::gentoo':
        require => Anchor['rvm::packages::begin'],
        before  => Class['rvm::packages::common'],
      }
    }
  }
  
  class { 'rvm::packages::common':
    before  => Anchor['rvm::packages::end'],
  }
}
