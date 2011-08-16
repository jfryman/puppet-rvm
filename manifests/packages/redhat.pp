class rvm::packages::redhat {
  $package_list = ['gcc-c++', 'patch', 'readline', 'readline-devel', 'zlib', 
                   'zlib-devel', 'libyaml-devel', 'libffi-devel', 
                   'openssl-devel', 'make', 'bzip2']
                   
  # Virtualize Package list to prevent conflicts
  @package { $package_list:
    ensure => 'present',
    tag    => 'rvm-packages',
  }
  
  # Realize packages list. 
  Package<| tag == 'rvm-packages' |>
}