#
# Class osgrepo
#
# Sets up OSG Software for Enterprise Linux repos
#
class osgrepo (
    $os_maj_release             = $osgrepo::params::os_maj_release,
    $osg_version                = $osgrepo::params::osg_version,

    $osgrepo_baseurl            = $osgrepo::params::osgrepo_baseurl,
    $osgrepo_enabled            = $osgrepo::params::osgrepo_enabled,
    $osgrepo_failovermethod     = $osgrepo::params::osgrepo_failovermethod,
    $osgrepo_gpgcheck           = $osgrepo::params::osgrepo_gpgcheck,
    $osgrepo_mirrorlist         = $osgrepo::params::osgrepo_mirrorlist,
    $osgrepo_priority           = $osgrepo::params::osgrepo_priority,

    $osgrepo_contrib_baseurl        = $osgrepo::params::osgrepo_contrib_baseurl,
    $osgrepo_contrib_enabled        = $osgrepo::params::osgrepo_contrib_enabled,
    $osgrepo_contrib_failovermethod = $osgrepo::params::osgrepo_contrib_failovermethod,
    $osgrepo_contrib_gpgcheck       = $osgrepo::params::osgrepo_contrib_gpgcheck,
    $osgrepo_contrib_mirrorlist     = $osgrepo::params::osgrepo_contrib_mirrorlist,
    $osgrepo_contrib_priority       = $osgrepo::params::osgrepo_contrib_priority,

    $osgrepo_testing_baseurl        = $osgrepo::params::osgrepo_testing_baseurl,
    $osgrepo_testing_enabled        = $osgrepo::params::osgrepo_testing_enabled,
    $osgrepo_testing_failovermethod = $osgrepo::params::osgrepo_testing_failovermethod,
    $osgrepo_testing_gpgcheck       = $osgrepo::params::osgrepo_testing_gpgcheck,
    $osgrepo_testing_mirrorlist     = $osgrepo::params::osgrepo_testing_mirrorlist,
    $osgrepo_testing_priority       = $osgrepo::params::osgrepo_testing_priority,

    $osgrepo_development_baseurl        = $osgrepo::params::osgrepo_development_baseurl,
    $osgrepo_development_enabled        = $osgrepo::params::osgrepo_development_enabled,
    $osgrepo_development_failovermethod = $osgrepo::params::osgrepo_development_failovermethod,
    $osgrepo_development_gpgcheck       = $osgrepo::params::osgrepo_development_gpgcheck,
    $osgrepo_development_mirrorlist     = $osgrepo::params::osgrepo_development_mirrorlist,
    $osgrepo_development_priority       = $osgrepo::params::osgrepo_development_priority,

    $osgrepo_upcoming_baseurl        = $osgrepo::params::osgrepo_upcoming_baseurl,
    $osgrepo_upcoming_enabled        = $osgrepo::params::osgrepo_upcoming_enabled,
    $osgrepo_upcoming_failovermethod = $osgrepo::params::osgrepo_upcoming_failovermethod,
    $osgrepo_upcoming_gpgcheck       = $osgrepo::params::osgrepo_upcoming_gpgcheck,
    $osgrepo_upcoming_mirrorlist     = $osgrepo::params::osgrepo_upcoming_mirrorlist,
    $osgrepo_upcoming_priority       = $osgrepo::params::osgrepo_upcoming_priority,

    $osgrepo_upcoming_testing_baseurl        = $osgrepo::params::osgrepo_upcoming_testing_baseurl,
    $osgrepo_upcoming_testing_enabled        = $osgrepo::params::osgrepo_upcoming_testing_enabled,
    $osgrepo_upcoming_testing_failovermethod = $osgrepo::params::osgrepo_upcoming_testing_failovermethod,
    $osgrepo_upcoming_testing_gpgcheck       = $osgrepo::params::osgrepo_upcoming_testing_gpgcheck,
    $osgrepo_upcoming_testing_mirrorlist     = $osgrepo::params::osgrepo_upcoming_testing_mirrorlist,
    $osgrepo_upcoming_testing_priority       = $osgrepo::params::osgrepo_upcoming_testing_priority,

    $osgrepo_upcoming_development_baseurl        = $osgrepo::params::osgrepo_upcoming_development_baseurl,
    $osgrepo_upcoming_development_enabled        = $osgrepo::params::osgrepo_upcoming_development_enabled,
    $osgrepo_upcoming_development_failovermethod = $osgrepo::params::osgrepo_upcoming_development_failovermethod,
    $osgrepo_upcoming_development_gpgcheck       = $osgrepo::params::osgrepo_upcoming_development_gpgcheck,
    $osgrepo_upcoming_development_mirrorlist     = $osgrepo::params::osgrepo_upcoming_development_mirrorlist,
    $osgrepo_upcoming_development_priority       = $osgrepo::params::osgrepo_upcoming_development_priority,
) inherits osgrepo::params {

    if $::osfamily == 'RedHat' and $::operatingsystem !~ /Fedora|Amazon/ {

      yumrepo { 'osg':
            descr          => "OSG Software for Enterprise Linux ${::os_maj_version} - \$basearch",
            baseurl        => $osgrepo_baseurl,
            enabled        => $osgrepo_enabled,
            failovermethod => $osgrepo_failovermethod,
            gpgcheck       => $osgrepo_gpgcheck,
            mirrorlist     => $osgrepo_mirrorlist,
            priority       => $osgrepo_priority,
        }

        yumrepo { 'osg-contrib':
            descr          => "OSG Software for Enterprise Linux ${::os_maj_version} - Contributed - \$basearch",
            baseurl        => $osgrepo_contrib_baseurl,
            enabled        => $osgrepo_contrib_enabled,
            failovermethod => $osgrepo_contrib_failovermethod,
            gpgcheck       => $osgrepo_contrib_gpgcheck,
            mirrorlist     => $osgrepo_contrib_mirrorlist,
            priority       => $osgrepo_contrib_priority,
        }

        yumrepo { 'osg-testing':
            descr          => "OSG Software for Enterprise Linux ${::os_maj_version} - Testing - \$basearch",
            baseurl        => $osgrepo_testing_baseurl,
            enabled        => $osgrepo_testing_enabled,
            failovermethod => $osgrepo_testing_failovermethod,
            gpgcheck       => $osgrepo_testing_gpgcheck,
            mirrorlist     => $osgrepo_testing_mirrorlist,
            priority       => $osgrepo_testing_priority,
        }

        yumrepo { 'osg-development':
            descr          => "OSG Software for Enterprise Linux ${::os_maj_version} - Development - \$basearch",
            baseurl        => $osgrepo_development_baseurl,
            enabled        => $osgrepo_development_enabled,
            failovermethod => $osgrepo_development_failovermethod,
            gpgcheck       => $osgrepo_development_gpgcheck,
            mirrorlist     => $osgrepo_development_mirrorlist,
            priority       => $osgrepo_development_priority,
        }

        yumrepo { 'osg-upcoming':
            descr          => "OSG Software for Enterprise Linux ${::os_maj_version} - Upcoming - \$basearch",
            baseurl        => $osgrepo_upcoming_baseurl,
            enabled        => $osgrepo_upcoming_enabled,
            failovermethod => $osgrepo_upcoming_failovermethod,
            gpgcheck       => $osgrepo_upcoming_gpgcheck,
            mirrorlist     => $osgrepo_upcoming_mirrorlist,
            priority       => $osgrepo_upcoming_priority,
        }

        yumrepo { 'osg-upcoming-testing':
            descr          => "OSG Software for Enterprise Linux ${::os_maj_version} - Upcoming - Testing - \$basearch",
            baseurl        => $osgrepo_upcoming_testing_baseurl,
            enabled        => $osgrepo_upcoming_testing_enabled,
            failovermethod => $osgrepo_upcoming_testing_failovermethod,
            gpgcheck       => $osgrepo_upcoming_testing_gpgcheck,
            mirrorlist     => $osgrepo_upcoming_testing_mirrorlist,
            priority       => $osgrepo_upcoming_testing_priority,
        }

        yumrepo { 'osg-upcoming-development':
            descr          => "OSG Software for Enterprise Linux ${::os_maj_version} - Upcoming - Development - \$basearch",
            baseurl        => $osgrepo_upcoming_development_baseurl,
            enabled        => $osgrepo_upcoming_development_enabled,
            failovermethod => $osgrepo_upcoming_development_failovermethod,
            gpgcheck       => $osgrepo_upcoming_development_gpgcheck,
            mirrorlist     => $osgrepo_upcoming_development_mirrorlist,
            priority       => $osgrepo_upcoming_development_priority,
        }

        file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-OSG':
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            source => 'puppet:///modules/osgrepo/RPM-GPG-KEY-OSG',
        }

        osgrepo::rpm_gpg_key { 'OSG':
            path   => '/etc/pki/rpm-gpg/RPM-GPG-KEY-OSG',
            before => Yumrepo[ 'osg', 'osg-testing', 'osg-development' ],
        }

    } else {
        notice ("No OSG repo available for ${::operatingsystem}")
    }

}
