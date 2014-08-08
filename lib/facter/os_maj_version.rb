# Duplicate from https://github.com/stahnma/puppet-module-epel because it works
# Doesn't seem to be harm in defining the fact twice other than extra cycles

# Get major version of OS without requiring LSB
Facter.add(:os_maj_version) do
  setcode do
    v = Facter.value(:operatingsystemrelease)
    v.split('.')[0].strip
  end
end
