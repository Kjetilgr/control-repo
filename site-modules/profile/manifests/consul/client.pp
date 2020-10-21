# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::consul::client
class profile::consul::client {

  package { 'unzip':
    ensure => latest,
  }

  class { '::consul':
    version     => '1.6.0',
    config_hash => {
      'data_dir'         => '/opt/consul',
      'datacenter'       => 'NTNU',
      'log_level'        => 'INFO',
      'node_name'        => $facts['hostname'],
      'retry_join'       => [ $::serverip ],
    },
    require     => Package['unzip'],
  }

}

