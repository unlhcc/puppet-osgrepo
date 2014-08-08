class osgrepo::params {

    $osgrepo_baseurl = "http://repo.grid.iu.edu/osg/3.2/el${::os_maj_version}/release/\$basearch"
    $osgrepo_enabled = '1'
    $osgrepo_failovermethod = 'priority'
    $osgrepo_gpgcheck = 1
    $osgrepo_mirrorlist = "http://repo.grid.iu.edu/mirror/osg/3.2/el${::os_maj_version}/release/\$basearch"
    $osgrepo_priority = '98'

    $osgrepo_testing_baseurl = "http://repo.grid.iu.edu/osg/3.2/el${::os_maj_version}/testing/\$basearch"
    $osgrepo_testing_enabled = '0'
    $osgrepo_testing_failovermethod = 'priority'
    $osgrepo_testing_gpgcheck = '1'
    $osgrepo_testing_mirrorlist = "http://repo.grid.iu.edu/mirror/osg/3.2/el${::os_maj_version}/testing/\$basearch"
    $osgrepo_testing_priority = '98'

    $osgrepo_development_baseurl = "http://repo.grid.iu.edu/osg/3.2/el${::os_maj_version}/development/\$basearch"
    $osgrepo_development_enabled = '0'
    $osgrepo_development_failovermethod = 'priority'
    $osgrepo_development_gpgcheck = '1'
    $osgrepo_development_mirrorlist = "http://repo.grid.iu.edu/mirror/osg/3.2/el${::os_maj_version}/development/\$basearch"
    $osgrepo_development_priority = '98'

}
