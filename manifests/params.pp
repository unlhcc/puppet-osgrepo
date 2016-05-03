class osgrepo::params {

  if $::operatingsystemmajrelease {
    $os_maj_release = $::operatingsystemmajrelease
    } else {
    $os_versions    = split($::operatingsystemrelease, '[.]')
    $os_maj_release = $os_versions[0]
  }

  $osg_version = 3.3

  #$osgrepo_baseurl = "http://repo.grid.iu.edu/osg/${osg_version}/el${::os_maj_version}/release/\$basearch"
  $osgrepo_enabled = '1'
  $osgrepo_failovermethod = 'priority'
  $osgrepo_gpgcheck = 1
  $osgrepo_mirrorlist = "http://repo.grid.iu.edu/mirror/osg/${osg_version}/el${::os_maj_version}/release/\$basearch"
  $osgrepo_priority = '98'

  #$osgrepo_contrib_baseurl = "http://repo.grid.iu.edu/osg/${osg_version}/el${::os_maj_version}/contrib/\$basearch"
  $osgrepo_contrib_enabled = '1'
  $osgrepo_contrib_failovermethod = 'priority'
  $osgrepo_contrib_gpgcheck = '1'
  $osgrepo_contrib_mirrorlist = "http://repo.grid.iu.edu/mirror/osg/${osg_version}/el${::os_maj_version}/contrib/\$basearch"
  $osgrepo_contrib_priority = '98'

  #$osgrepo_testing_baseurl = "http://repo.grid.iu.edu/osg/${osg_version}/el${os_maj_version}/testing/\$basearch"
  $osgrepo_testing_enabled = '0'
  $osgrepo_testing_failovermethod = 'priority'
  $osgrepo_testing_gpgcheck = '1'
  $osgrepo_testing_mirrorlist = "http://repo.grid.iu.edu/mirror/osg/${osg_version}/el${::os_maj_version}/testing/\$basearch"
  $osgrepo_testing_priority = '98'

  #$osgrepo_development_baseurl = "http://repo.grid.iu.edu/osg/${osg_version}/el${::os_maj_version}/development/\$basearch"
  $osgrepo_development_enabled = '0'
  $osgrepo_development_failovermethod = 'priority'
  $osgrepo_development_gpgcheck = '1'
  $osgrepo_development_mirrorlist = "http://repo.grid.iu.edu/mirror/osg/${osg_version}/el${::os_maj_version}/development/\$basearch"
  $osgrepo_development_priority = '98'

  #$osgrepo_upcoming_baseurl = "http://repo.grid.iu.edu/osg/upcoming/el${::os_maj_version}/release/\$basearch"
  $osgrepo_upcoming_enabled = '0'
  $osgrepo_upcoming_failovermethod = 'priority'
  $osgrepo_upcoming_gpgcheck = '1'
  $osgrepo_upcoming_mirrorlist = "http://repo.grid.iu.edu/mirror/osg/upcoming/el${::os_maj_version}/release/\$basearch"
  $osgrepo_upcoming_priority = '98'

}
