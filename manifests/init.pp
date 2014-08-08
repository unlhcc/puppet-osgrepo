#
# Class osgrepo
#
# Sets up OSG Software for Enterprise Linux repos
#

class osgrepo (
    $osgrepo_baseurl            = $osgrepo::params::osgrepo_baseurl,
    $osgrepo_enabled            = $osgrepo::params::osgrepo_enabled,
    $osgrepo_failovermethod     = $osgrepo::params::osgrepo_failovermethod,
    $osgrepo_gpgcheck           = $osgrepo::params::osgrepo_gpgcheck,
    $osgrepo_mirrorlist         = $osgrepo::params::osgrepo_mirrorlist,
    $osgrepo_priority           = $osgrepo::params::osgrepo_priority,

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
) inherits osgrepo::params {

    if $::osfamily == 'RedHat' and $::operatingsystem !~ /Fedora|Amazon/ {

        yumrepo { 'osg':
            descr           => "OSG Software for Enterprise Linux ${::os_maj_version} - \$basearch",
            baseurl         => $osgrepo_baseurl,
            enabled         => $osgrepo_enabled,
            failovermethod  => $osgrepo_failovermethod,
            gpgcheck        => $osgrepo_gpgcheck,
            mirrorlist      => $osgrepo_mirrorlist,
            priority        => $osgrepo_priority,
        }

        yumrepo { 'osg-testing':
            descr           => "OSG Software for Enterprise Linux ${::os_maj_version} - Testing - \$basearch",
            baseurl         => $osgrepo_testing_baseurl,
            enabled         => $osgrepo_testing_enabled,
            failovermethod  => $osgrepo_testing_failovermethod,
            gpgcheck        => $osgrepo_testing_gpgcheck,
            mirrorlist      => $osgrepo_testing_mirrorlist,
            priority        => $osgrepo_testing_priority,
        }

        yumrepo { 'osg-development':
            descr           => "OSG Software for Enterprise Linux ${::os_maj_version} - Development - \$basearch",
            baseurl         => $osgrepo_development_baseurl,
            enabled         => $osgrepo_development_enabled,
            failovermethod  => $osgrepo_development_failovermethod,
            gpgcheck        => $osgrepo_development_gpgcheck,
            mirrorlist      => $osgrepo_development_mirrorlist,
            priority        => $osgrepo_development_priority,
        }

        file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-OSG':
            ensure  => present,
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            source  => 'puppet:///modules/osgrepo/RPM-GPG-KEY-OSG',
        }

        osgrepo::rpm_gpg_key { 'OSG':
            path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-OSG',
            before  => Yumrepo[ 'osg', 'osg-testing', 'osg-development' ],
        }

    } else {
        notice ("No OSG repo available for ${::operatingsystem}")
    }

}
