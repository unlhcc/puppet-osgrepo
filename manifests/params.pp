class osgrepo::params {
  # Setting to 'absent' will fall back to the yum.conf
  # Setting proxy here will be the default for all repos.
  #
  #  If you wish to set a proxy for an individual set of repos,
  #   you can declare $proxy in that class, and should scope to
  #   the most specific declaration of proxy.
  $proxy = 'absent'

  if $::operatingsystemmajrelease {
    $os_maj_release = $::operatingsystemmajrelease
    } else {
    $os_versions    = split($::operatingsystemrelease, '[.]')
    $os_maj_release = $os_versions[0]
  }

  $epel_mirrorlist                        = "https://mirrors.fedoraproject.org/metalink?repo=epel-${os_maj_release}&arch=\$basearch"
  $epel_baseurl                           = 'absent'
  $epel_failovermethod                    = 'priority'
  $epel_proxy                             = $proxy
  $epel_enabled                           = '1'
  $epel_gpgcheck                          = '1'

  $epel_debuginfo_mirrorlist              = "https://mirrors.fedoraproject.org/metalink?repo=epel-debug-${os_maj_release}&arch=\$basearch"
  $epel_debuginfo_baseurl                 = 'absent'
  $epel_debuginfo_failovermethod          = 'priority'
  $epel_debuginfo_proxy                   = $proxy
  $epel_debuginfo_enabled                 = '0'
  $epel_debuginfo_gpgcheck                = '1'

  $epel_source_mirrorlist                 = "https://mirrors.fedoraproject.org/metalink?repo=epel-source-${os_maj_release}&arch=\$basearch"
  $epel_source_baseurl                    = 'absent'
  $epel_source_failovermethod             = 'priority'
  $epel_source_proxy                      = $proxy
  $epel_source_enabled                    = '0'
  $epel_source_gpgcheck                   = '1'

  #$epel_testing_baseurl                   = "https://download.fedoraproject.org/pub/epel/testing/${os_maj_release}/\$basearch"
  $epel_testing_mirrorlist                = "https://mirrors.fedoraproject.org/metalink?repo=testing-epel${os_maj_release}&arch=\$basearch"
  $epel_testing_failovermethod            = 'priority'
  $epel_testing_proxy                     = $proxy
  $epel_testing_enabled                   = '0'
  $epel_testing_gpgcheck                  = '1'

  #$epel_testing_debuginfo_baseurl         = "https://download.fedoraproject.org/pub/epel/testing/${os_maj_release}/\$basearch/debug"
  $epel_testing_debuginfo_mirrorlist      = "https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel${os_maj_release}&arch=\$basearch"
  $epel_testing_debuginfo_failovermethod  = 'priority'
  $epel_testing_debuginfo_proxy           = $proxy
  $epel_testing_debuginfo_enabled         = '0'
  $epel_testing_debuginfo_gpgcheck        = '1'

  #$epel_testing_source_baseurl            = "https://download.fedoraproject.org/pub/epel/testing/${os_maj_release}/SRPMS"
  $epel_testing_source_mirrorlist      = "https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel${os_maj_release}&arch=\$basearch"
  $epel_testing_source_failovermethod     = 'priority'
  $epel_testing_source_proxy              = $proxy
  $epel_testing_source_enabled            = '0'
  $epel_testing_source_gpgcheck           = '1'

  $osg_version = 3.3

  #$osgrepo_baseurl = "http://repo.grid.iu.edu/osg/$osg_version/el${::os_maj_version}/release/\$basearch"
  $osgrepo_enabled = '1'
  $osgrepo_failovermethod = 'priority'
  $osgrepo_gpgcheck = 1
  $osgrepo_mirrorlist = "http://repo.grid.iu.edu/mirror/osg/$osg_version/el${::os_maj_version}/release/\$basearch"
  $osgrepo_priority = '98'

  #$osgrepo_testing_baseurl = "http://repo.grid.iu.edu/osg/$osg_version/el${::os_maj_version}/testing/\$basearch"
  $osgrepo_testing_enabled = '0'
  $osgrepo_testing_failovermethod = 'priority'
  $osgrepo_testing_gpgcheck = '1'
  $osgrepo_testing_mirrorlist = "http://repo.grid.iu.edu/mirror/osg/$osg_version/el${::os_maj_version}/testing/\$basearch"
  $osgrepo_testing_priority = '98'

  #$osgrepo_development_baseurl = "http://repo.grid.iu.edu/osg/$osg_version/el${::os_maj_version}/development/\$basearch"
  $osgrepo_development_enabled = '0'
  $osgrepo_development_failovermethod = 'priority'
  $osgrepo_development_gpgcheck = '1'
  $osgrepo_development_mirrorlist = "http://repo.grid.iu.edu/mirror/osg/$osg_version/el${::os_maj_version}/development/\$basearch"
  $osgrepo_development_priority = '98'

}
