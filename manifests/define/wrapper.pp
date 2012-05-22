define rvm::define::wrapper(
  $ensure = 'present',
  $ruby_version,
  $prefix
) {
  Exec {
    path    => '/usr/local/rvm/bin:/bin:/sbin:/usr/bin:/usr/sbin',
  }
  $rvm_source = "source /usr/local/rvm/scripts/rvm"
  $wrapper_exists = "bash -c '${rvm_source} ; rvm use ${ruby_version} ; which ${prefix}_${name}'"

  if $ensure == 'present' {
    exec { "rvm-alias-create-${name}-${ruby_version}":
      command => "bash -c '${rvm_source} ; rvm use ${ruby_version} ; rvm wrapper ${ruby_version} ${prefix} ${name}'",
      unless => $wrapper_exists,
      require => [Class['rvm'], Exec["install-ruby-${ruby_version}"]],
    }
  } elsif $ensure == 'absent' {
    exec { "rvm-gemset-delete-${name}-${ruby_version}":
      command => "bash -c '${rvm_source} ; rvm use ${ruby_version} ; rm `which ${prefix}_${name}`'",
      onlyif => $wrapper_exists,
      require => [Class['rvm'], Exec["install-ruby-${ruby_version}"]],
    }
  }
}
