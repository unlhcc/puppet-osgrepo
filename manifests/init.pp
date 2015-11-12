#
# Class osgrepo
#
# Sets up OSG Software for Enterprise Linux repos
#

class osgrepo (
  $epel_mirrorlist                        = $osgrepo::params::epel_mirrorlist,
  $epel_baseurl                           = $osgrepo::params::epel_baseurl,
  $epel_failovermethod                    = $osgrepo::params::epel_failovermethod,
  $epel_proxy                             = $osgrepo::params::epel_proxy,
  $epel_enabled                           = $osgrepo::params::epel_enabled,
  $epel_gpgcheck                          = $osgrepo::params::epel_gpgcheck,
  $epel_exclude                           = undef,
  $epel_includepkgs                       = undef,
  $epel_testing_mirrorlist                = $osgrepo::params::epel_testing_mirrorlist,
  $epel_testing_baseurl                   = $osgrepo::params::epel_testing_baseurl,
  $epel_testing_failovermethod            = $osgrepo::params::epel_testing_failovermethod,
  $epel_testing_proxy                     = $osgrepo::params::epel_testing_proxy,
  $epel_testing_enabled                   = $osgrepo::params::epel_testing_enabled,
  $epel_testing_gpgcheck                  = $osgrepo::params::epel_testing_gpgcheck,
  $epel_testing_exclude                   = undef,
  $epel_testing_includepkgs               = undef,
  $epel_source_mirrorlist                 = $osgrepo::params::epel_source_mirrorlist,
  $epel_source_baseurl                    = $osgrepo::params::epel_source_baseurl,
  $epel_source_failovermethod             = $osgrepo::params::epel_source_failovermethod,
  $epel_source_proxy                      = $osgrepo::params::epel_source_proxy,
  $epel_source_enabled                    = $osgrepo::params::epel_source_enabled,
  $epel_source_gpgcheck                   = $osgrepo::params::epel_source_gpgcheck,
  $epel_source_exclude                    = undef,
  $epel_source_includepkgs                = undef,
  $epel_debuginfo_mirrorlist              = $osgrepo::params::epel_debuginfo_mirrorlist,
  $epel_debuginfo_baseurl                 = $osgrepo::params::epel_debuginfo_baseurl,
  $epel_debuginfo_failovermethod          = $osgrepo::params::epel_debuginfo_failovermethod,
  $epel_debuginfo_proxy                   = $osgrepo::params::epel_debuginfo_proxy,
  $epel_debuginfo_enabled                 = $osgrepo::params::epel_debuginfo_enabled,
  $epel_debuginfo_gpgcheck                = $osgrepo::params::epel_debuginfo_gpgcheck,
  $epel_debuginfo_exclude                 = undef,
  $epel_debuginfo_includepkgs             = undef,
  $epel_testing_source_baseurl            = $osgrepo::params::epel_testing_source_baseurl,
  $epel_testing_source_failovermethod     = $osgrepo::params::epel_testing_source_failovermethod,
  $epel_testing_source_proxy              = $osgrepo::params::epel_testing_source_proxy,
  $epel_testing_source_enabled            = $osgrepo::params::epel_testing_source_enabled,
  $epel_testing_source_gpgcheck           = $osgrepo::params::epel_testing_source_gpgcheck,
  $epel_testing_source_exclude            = undef,
  $epel_testing_source_includepkgs        = undef,
  $epel_testing_debuginfo_baseurl         = $osgrepo::params::epel_testing_debuginfo_baseurl,
  $epel_testing_debuginfo_failovermethod  = $osgrepo::params::epel_testing_debuginfo_failovermethod,
  $epel_testing_debuginfo_proxy           = $osgrepo::params::epel_testing_debuginfo_proxy,
  $epel_testing_debuginfo_enabled         = $osgrepo::params::epel_testing_debuginfo_enabled,
  $epel_testing_debuginfo_gpgcheck        = $osgrepo::params::epel_testing_debuginfo_gpgcheck,
  $epel_testing_debuginfo_exclude         = undef,
  $epel_testing_debuginfo_includepkgs     = undef,
  $os_maj_release                         = $osgrepo::params::os_maj_release,
  $osg_version                            = $osgrepo::params::osg_version,
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

    file { "/etc/yum.conf":
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => "puppet:///modules/epel/yum.conf",
    }

    file { "/etc/rpm/macros.ghc-srpm":
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => "puppet:///modules/epel/macros.hgc-srpm",
    }

    yumrepo { 'epel-testing':
      baseurl        => $epel_testing_baseurl,
      failovermethod => $epel_testing_failovermethod,
      proxy          => $epel_testing_proxy,
      enabled        => $epel_testing_enabled,
      gpgcheck       => $epel_testing_gpgcheck,
      gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
      descr          => "Extra Packages for Enterprise Linux ${os_maj_release} - Testing - \$basearch ",
      exclude        => $epel_testing_exclude,
      includepkgs    => $epel_testing_includepkgs,
    }

    yumrepo { 'epel-testing-debuginfo':
      baseurl        => $epel_testing_debuginfo_baseurl,
      failovermethod => $epel_testing_debuginfo_failovermethod,
      proxy          => $epel_testing_debuginfo_proxy,
      enabled        => $epel_testing_debuginfo_enabled,
      gpgcheck       => $epel_testing_debuginfo_gpgcheck,
      gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
      descr          => "Extra Packages for Enterprise Linux ${os_maj_release} - Testing - \$basearch - Debug",
      exclude        => $epel_testing_debuginfo_exclude,
      includepkgs    => $epel_testing_debuginfo_includepkgs,
    }

  yumrepo { 'epel-testing-source':
    baseurl        => $epel_testing_source_baseurl,
    failovermethod => $epel_testing_source_failovermethod,
    proxy          => $epel_testing_source_proxy,
    enabled        => $epel_testing_source_enabled,
    gpgcheck       => $epel_testing_source_gpgcheck,
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
    descr          => "Extra Packages for Enterprise Linux ${os_maj_release} - Testing - \$basearch - Source",
    exclude        => $epel_testing_source_exclude,
    includepkgs    => $epel_testing_source_includepkgs,
  }

  yumrepo { 'epel':
    mirrorlist     => $epel_mirrorlist,
    baseurl        => $epel_baseurl,
    failovermethod => $epel_failovermethod,
    proxy          => $epel_proxy,
    enabled        => $epel_enabled,
    gpgcheck       => $epel_gpgcheck,
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
    descr          => "Extra Packages for Enterprise Linux ${os_maj_release} - \$basearch",
    exclude        => $epel_exclude,
    includepkgs    => $epel_includepkgs,
    }

    yumrepo { 'epel-debuginfo':
      mirrorlist     => $epel_debuginfo_mirrorlist,
      baseurl        => $epel_debuginfo_baseurl,
      failovermethod => $epel_debuginfo_failovermethod,
      proxy          => $epel_debuginfo_proxy,
      enabled        => $epel_debuginfo_enabled,
      gpgcheck       => $epel_debuginfo_gpgcheck,
      gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
      descr          => "Extra Packages for Enterprise Linux ${os_maj_release} - \$basearch - Debug",
      exclude        => $epel_debuginfo_exclude,
      includepkgs    => $epel_debuginfo_includepkgs,
    }

    yumrepo { 'epel-source':
      mirrorlist     => $epel_source_mirrorlist,
      baseurl        => $epel_source_baseurl,
      failovermethod => $epel_source_failovermethod,
      proxy          => $epel_source_proxy,
      enabled        => $epel_source_enabled,
      gpgcheck       => $epel_source_gpgcheck,
      gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
      descr          => "Extra Packages for Enterprise Linux ${os_maj_release} - \$basearch - Source",
      exclude        => $epel_source_exclude,
      includepkgs    => $epel_source_includepkgs,
    }

    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}":
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => "puppet:///modules/epel/RPM-GPG-KEY-EPEL-${os_maj_release}",
    }

    osgrepo::rpm_gpg_key{ "EPEL-${os_maj_release}":
      path   => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${os_maj_release}",
      before => Yumrepo['epel','epel-source','epel-debuginfo','epel-testing','epel-testing-source','epel-testing-debuginfo'],
    }
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
