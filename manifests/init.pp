class rvm {
  include stdlib
  
  anchor { 'rvm::begin': }
  anchor { 'rvm::end': }
  
  class { 'rvm::packages':
    require => Anchor['rvm::begin'],
    before  => Class['rvm::config'],
  }
  class { 'rvm::config': 
    before => Anchor['rvm::end'],
  }
}
