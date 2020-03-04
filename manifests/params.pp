# Class osgrepo::params
#
# Defaults set to match OSG osg-release .repo contents wherever possible
#
class osgrepo::params {

    if $::operatingsystemmajrelease {
        $os_maj_release = $::operatingsystemmajrelease
    } else {
        $os_versions    = split($::operatingsystemrelease, '[.]')
        $os_maj_release = $os_versions[0]
    }

    $osg_version = lookup('osgrepo::osg_version', String, 'first', '3.5')

    $osgrepo_baseurl = absent
    $osgrepo_enabled = '1'
    $osgrepo_failovermethod = 'priority'
    $osgrepo_gpgcheck = 1
    $osgrepo_mirrorlist = "http://repo.opensciencegrid.org/mirror/osg/${osg_version}/el${::os_maj_version}/release/\$basearch"
    $osgrepo_priority = '98'

    $osgrepo_contrib_baseurl = absent
    $osgrepo_contrib_enabled = '1'
    $osgrepo_contrib_failovermethod = 'priority'
    $osgrepo_contrib_gpgcheck = '1'
    $osgrepo_contrib_mirrorlist = "http://repo.opensciencegrid.org/mirror/osg/${osg_version}/el${::os_maj_version}/contrib/\$basearch"
    $osgrepo_contrib_priority = '98'

    $osgrepo_testing_baseurl = absent
    $osgrepo_testing_enabled = '0'
    $osgrepo_testing_failovermethod = 'priority'
    $osgrepo_testing_gpgcheck = '1'
    $osgrepo_testing_mirrorlist = "http://repo.opensciencegrid.org/mirror/osg/${osg_version}/el${::os_maj_version}/testing/\$basearch"
    $osgrepo_testing_priority = '98'

    $osgrepo_development_baseurl = absent
    $osgrepo_development_enabled = '0'
    $osgrepo_development_failovermethod = 'priority'
    $osgrepo_development_gpgcheck = '1'
    $osgrepo_development_mirrorlist = "http://repo.opensciencegrid.org/mirror/osg/${osg_version}/el${::os_maj_version}/development/\$basearch"
    $osgrepo_development_priority = '98'

    $osgrepo_upcoming_baseurl = absent
    $osgrepo_upcoming_enabled = '0'
    $osgrepo_upcoming_failovermethod = 'priority'
    $osgrepo_upcoming_gpgcheck = '1'
    $osgrepo_upcoming_mirrorlist = "http://repo.opensciencegrid.org/mirror/osg/upcoming/el${::os_maj_version}/release/\$basearch"
    $osgrepo_upcoming_priority = '98'

    $osgrepo_upcoming_testing_baseurl = absent
    $osgrepo_upcoming_testing_enabled = '0'
    $osgrepo_upcoming_testing_failovermethod = 'priority'
    $osgrepo_upcoming_testing_gpgcheck = '1'
    $osgrepo_upcoming_testing_mirrorlist = "http://repo.opensciencegrid.org/mirror/osg/upcoming/el${::os_maj_version}/testing/\$basearch"
    $osgrepo_upcoming_testing_priority = '98'

    $osgrepo_upcoming_development_baseurl = absent
    $osgrepo_upcoming_development_enabled = '0'
    $osgrepo_upcoming_development_failovermethod = 'priority'
    $osgrepo_upcoming_development_gpgcheck = '1'
    $osgrepo_upcoming_development_mirrorlist = "http://repo.opensciencegrid.org/mirror/osg/upcoming/el${::os_maj_version}/development/\$basearch"
    $osgrepo_upcoming_development_priority = '98'

}
