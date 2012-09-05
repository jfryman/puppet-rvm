class rvm::packages::debian {
 
  if ! defined(Package['build-essential'])      { package { 'build-essential':      ensure => installed } }
  if ! defined(Package['curl'])                 { package { 'curl':                 ensure => installed } }
  if ! defined(Package['bash'])                 { package { 'bash':                 ensure => installed } }
  if ! defined(Package['gawk'])                 { package { 'gawk':                 ensure => installed } }
  if ! defined(Package['sed'])                  { package { 'sed':                  ensure => installed } }
  if ! defined(Package['grep'])                 { package { 'grep':                 ensure => installed } }
  if ! defined(Package['gzip'])                 { package { 'gzip':                 ensure => installed } }
  if ! defined(Package['bzip2'])                { package { 'bzip2':                ensure => installed } }
  if ! defined(Package['zlib1g-dev'])           { package { 'zlib1g-dev':           ensure => installed } }
  if ! defined(Package['libssl-dev'])           { package { 'libssl-dev':           ensure => installed } }
  if ! defined(Package['libreadline5-dev'])     { package { 'libreadline5-dev':     ensure => installed } }

}
