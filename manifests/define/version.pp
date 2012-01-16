define rvm::define::version (
  $ensure = 'present',
  $system = 'false'
) {
  include rvm
  include rvm::helpers

  ## Set sensible defaults for Exec resource
  Exec {
    path    => '/usr/local/rvm/bin:/bin:/sbin:/usr/bin:/usr/sbin',
  }

  # Install or uninstall RVM Ruby Version
  if $ensure == 'present' {
    exec { "install-ruby-${name}":
      command => "/usr/local/rvm/bin/rvm install ${name}",
      unless  => "rvm list | grep ${name}",
      timeout => '0',
      require => Class['rvm'],
    }
  } elsif $ensure == 'absent' {
    exec { "uninstall-ruby-${name}":
      command => "/usr/local/rvm/bin/rvm uninstall ${name}",
      onlyif  => "rvm list | grep ${name}",
      require => Class['rvm'],
    }
  }

  # Establish Default System Ruby.
  # Only create one instance to prevent multiple ruby
  # versions from attempting to be system default.
  if ($system == 'true') and ($ensure != 'absent') {
    exec { "set-default-ruby-rvm-to-${name}":
      command => "/usr/local/bin/rvm_set_system_ruby ${name}",
      unless  => "rvm list | grep '* ${name}'",
      require => [Class['rvm'], Exec["install-ruby-${name}"]],
      notify  => Exec['rvm-cleanup'],
    }
  }
}
