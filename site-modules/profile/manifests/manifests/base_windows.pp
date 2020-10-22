class profile::base_windows {

  $win_sw_pkg = lookup('base_windows::win_sw_pkg')

  include chocolatey

  case $::operatingsystem {
    'windows':
      { Package { provider => chocolatey, } }
    default:
      { Package { provider => windows, } }
  }

  package { $win_sw_pkg:
    ensure => 'latest',
  }

  package { 'vim':
    ensure => '8.0.604',
  }

  dsc_xtimezone { 'Oslo':
    dsc_timezone         => 'W. Europe Standard Time',
    dsc_issingleinstance => 'yes',
  }

  dsc_windowsfeature {'FS-SMB1': 
    dsc_ensure => 'absent', 
    dsc_name   => 'FS-SMB1', 
  }

}

