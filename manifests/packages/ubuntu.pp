class rvm::packages::ubuntu {
  $package_list = ['build-essential', 'bash', 'gawk', 'sed', 'grep',
                   'gzip', 'bzip2', 'zlib1g-dev', 'libssl-dev', 
                   'libreadline-gplv2-dev']
                   
  # Virtualize Package list to prevent conflicts
  @package { $package_list:
    ensure => 'present',
    tag    => 'rvm-packages',
  }
  
  # Realize packages list. 
  Package<| tag == 'rvm-packages' |>
}
