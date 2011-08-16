# RVM Module

James Fryman <james@frymanet.com>

This module manages RVM from within Puppet.

# Quick Start

Install and bootstrap an RVM instance

# Requirements
_Puppet Labs Standard Library_
- http://github.com/puppetlabs/puppetlabs-stdlib


*Add a new Ruby instance via RVM and set as default system Ruby*
<pre>
  rvm::define::version { 'ree-1.8.7':
    ensure => 'present',
    system => 'true',
  }
</pre>

*Install a gem to a specific Ruby*
<pre>
  rvm::define::gem { 'puppet':
    ensure       => 'present',
    ruby_version => 'ree-1.8.7',
    gem_version  => '2.7.1',
  }
</pre>

*Add a user to allow RVM execution without Sudo*
<pre>
  rvm::define::user { 'jfryman': }
</pre>