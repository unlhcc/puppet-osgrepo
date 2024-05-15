# Class osgrepo::params
#
# Defaults set to match OSG osg-release .repo contents wherever possible
#
class osgrepo::params {

    if $facts['os']['name'] == 'Amazon' and $facts['os']['release']['major'] == '2' {
        # Amazon Linux 2 is equivalent of Enterprise Linux 7 so we use that version for epel
        # https://aws.amazon.com/premiumsupport/knowledge-center/ec2-enable-epel/
        $os_maj_release = '7'
    } else {
        $os_maj_release = $facts['os']['release']['major']
    }

    # failovermethod has been removed in EL8
    if versioncmp($os_maj_release,'8') >= 0 {
        $failovermethod = 'absent'
    } else {
        $failovermethod = 'priority'
    }

    $osg_version = lookup('osgrepo::osg_version', String, 'first', '3.6')

    $osgrepo_baseurl = absent
    $osgrepo_enabled = '1'
    $osgrepo_failovermethod = $failovermethod
    $osgrepo_gpgcheck = 1
    if Float($osg_version) < 23 {
        # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/3.6/el8/release/$basearch
        $osgrepo_mirrorlist = "https://repo.opensciencegrid.org/mirror/osg/${osg_version}/el${os_maj_release}/release/\$basearch"
    } else {
        # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/23-main/el8/release/$basearch
        $osgrepo_mirrorlist = "https://repo.opensciencegrid.org/mirror/osg/${osg_version}-main/el${os_maj_release}/release/\$basearch"
    }
    $osgrepo_priority = '98'

    $osgrepo_contrib_baseurl = absent
    $osgrepo_contrib_enabled = '1'
    $osgrepo_contrib_failovermethod = $failovermethod
    $osgrepo_contrib_gpgcheck = '1'
    if Float($osg_version) < 23 {
        # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/3.6/el8/contrib/$basearch
        $osgrepo_contrib_mirrorlist = "https://repo.opensciencegrid.org/mirror/osg/${osg_version}/el${os_maj_release}/contrib/\$basearch"
    } else {
        # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/23-contrib/el8/$basearch
        $osgrepo_contrib_mirrorlist = "https://repo.opensciencegrid.org/mirror/osg/${osg_version}-contrib/el${os_maj_release}/\$basearch"
    }
    $osgrepo_contrib_priority = '98'

    $osgrepo_testing_baseurl = absent
    $osgrepo_testing_enabled = '0'
    $osgrepo_testing_failovermethod = $failovermethod
    $osgrepo_testing_gpgcheck = '1'
    if Float($osg_version) < 23 {
        # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/3.6/el8/testing/$basearch
        $osgrepo_testing_mirrorlist = "https://repo.opensciencegrid.org/mirror/osg/${osg_version}/el${os_maj_release}/testing/\$basearch"
    } else {
        # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/23-main/el8/testing/$basearch
        $osgrepo_testing_mirrorlist = "https://repo.opensciencegrid.org/mirror/osg/${osg_version}-main/el${os_maj_release}/testing/\$basearch"
    }
    $osgrepo_testing_priority = '98'

    $osgrepo_development_baseurl = absent
    $osgrepo_development_enabled = '0'
    $osgrepo_development_failovermethod = $failovermethod
    $osgrepo_development_gpgcheck = '1'
    if Float($osg_version) < 23 {
        # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/3.6/el8/development/$basearch
        $osgrepo_development_mirrorlist = "https://repo.opensciencegrid.org/mirror/osg/${osg_version}/el${os_maj_release}/development/\$basearch"
    } else {
        # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/23-main/el8/development/$basearch
        $osgrepo_development_mirrorlist = "https://repo.opensciencegrid.org/mirror/osg/${osg_version}-main/el${os_maj_release}/development/\$basearch"
    }
    $osgrepo_development_priority = '98'

    $osgrepo_upcoming_baseurl = absent
    $osgrepo_upcoming_enabled = '0'
    $osgrepo_upcoming_failovermethod = $failovermethod
    $osgrepo_upcoming_gpgcheck = '1'
    # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/3.6-upcoming/el8/release/$basearch
    # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/23-upcoming/el8/release/$basearch
    $osgrepo_upcoming_mirrorlist = "https://repo.opensciencegrid.org/mirror/osg/${osg_version}-upcoming/el${os_maj_release}/release/\$basearch"
    $osgrepo_upcoming_priority = '98'

    $osgrepo_upcoming_testing_baseurl = absent
    $osgrepo_upcoming_testing_enabled = '0'
    $osgrepo_upcoming_testing_failovermethod = $failovermethod
    $osgrepo_upcoming_testing_gpgcheck = '1'
    # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/3.6-upcoming/el8/testing/$basearch
    # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/23-upcoming/el8/testing/$basearch
    $osgrepo_upcoming_testing_mirrorlist = "https://repo.opensciencegrid.org/mirror/osg/${osg_version}-upcoming/el${os_maj_release}/testing/\$basearch"
    $osgrepo_upcoming_testing_priority = '98'

    $osgrepo_upcoming_development_baseurl = absent
    $osgrepo_upcoming_development_enabled = '0'
    $osgrepo_upcoming_development_failovermethod = $failovermethod
    $osgrepo_upcoming_development_gpgcheck = '1'
    # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/3.6-upcoming/el8/development/$basearch
    # mirrorlist=https://repo.opensciencegrid.org/mirror/osg/23-upcoming/el8/development/$basearch
    $osgrepo_upcoming_development_mirrorlist = "https://repo.opensciencegrid.org/mirror/osg/${osg_version}-upcoming/el${os_maj_release}/development/\$basearch"
    $osgrepo_upcoming_development_priority = '98'

}
