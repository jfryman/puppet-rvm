class rvm::packages::gentoo {

  # Packages for MRI Ruby on a Gentoo Base System release 2.0.3
  $package_list = ['openssl', 'readline', 'curl', 'git', 'zlib',
    'libxml2', 'libxslt', 'ncurses', 'bison', 'subversion']

  @package { $package_list: ensure => present }

  Package<| tag == 'rvm-packages' |>
}
