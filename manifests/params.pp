class osgrepo::params {

    $osgrepo_baseurl = "http://repo.grid.iu.edu/osg/3.2/el${::lsbmajdistrelease}/release/$basearch"
    $osgrepo_enabled = '1'
    $osgrepo_failovermethod = 'priority'
    $osgrepo_gpgcheck = 1
    $osgrepo_gpgkey = 'absent'
    $osgrepo_mirrorlist = "http://repo.grid.iu.edu/mirror/osg/3.2/el${::lsbmajdistrelease}/release/$basearch"
    $osgrepo_priority = '98'

    $osgrepo_testing_baseurl = "http://t2.unl.edu/store/repos/hcc/${::lsbmajdistrelease}/hcc-el${::lsbmajdistrelease}-testing/\$basearch"
    $osgrepo_testing_enabled = '0'
    $osgrepo_testing_failovermethod = 'priority'
    $osgrepo_testing_gpgcheck = '1'
    $osgrepo_testing_gpgkey = 'absent'
    $osgrepo_testing_mirrorlist = "
    $osgrepo_testing_priority = '98'

}
