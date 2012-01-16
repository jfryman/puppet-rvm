# Compliments of Toni Leino (Frodotus)
# https://github.com/Frodotus/puppet-rvm/commit/17d854f20f0d49185938f84c4108823e9212c02a
define rvm::define::gemset(
  $ensure = 'present',
  $ruby_version
) {
  ## Set sensible defaults for Exec resource
  Exec {
    path    => '/usr/local/rvm/bin:/bin:/sbin:/usr/bin:/usr/sbin',
  }
  $rvm_source = "source /usr/local/rvm/scripts/rvm"
  if $ensure == 'present' {
    exec { "rvm-gemset-create-${name}-${ruby_version}":
      command => "bash -c '${rvm_source} ; rvm use ${ruby_version} ; rvm gemset create ${name}'",
      unless  => "bash -c '${rvm_source} ; rvm use ${ruby_version} ; rvm gemset list | grep ${name}'",
      require => [Class['rvm'], Exec["install-ruby-${ruby_version}"]],
    }
  } elsif $ensure == 'absent' {
    exec { "rvm-gemset-delete-${name}-${ruby_version}":
      command => "bash -c '${rvm_source} ; rvm use ${ruby_version} ;  rvm --force gemset delete ${name}'",
      onlyif  => "bash -c '${rvm_source} ; rvm use ${ruby_version} ; rvm gemset list | grep ${name}'",
      require => [Class['rvm'], Exec["install-ruby-${ruby_version}"]],
    }
  }
}
