name 'chef-client-base'
maintainer 'Scalr'
maintainer_email 'lynn@scalr.com'
license 'All Rights Reserved'
description 'Installs/Configures chef-client-base'
long_description 'Installs/Configures chef-client-base'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

issues_url 'https://github.com/lcc2207/chef-client-base/issues'
source_url 'https://github.com/lcc2207/chef-client-base'

depends 'chef_client_updater', '~> 3.3.2'
depends 'chef-client', '~> 10.0.4'
depends 'sensu', '~> 4.3.1'
depends 'chef-sugar'
depends 'ntp', '~> 3.5.6'
