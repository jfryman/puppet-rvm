class rvm::packages::debian {
  $package_list = ['build-essential', 'curl', 'bash', 'gawk', 'sed', 'grep',
                   'gzip', 'bzip2', 'zlib1g-dev', 'libssl-dev', 
                   'libreadline5-dev']
                   
  # Virtualize Package list to prevent conflicts
  @package { $package_list:
    ensure => 'present',
    tag    => 'rvm-packages',
  }
  
  # Realize packages list. 
  Package<| tag == 'rvm-packages' |>
}
