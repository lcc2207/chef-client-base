include_recipe 'chef-sugar'
if amazon_linux?
  # fix issue with sensu gem installs on AWS linux
  link '/bin/install' do
    to '/usr/bin/install'
  end

  node.default['sensu']['yum_repo_releasever'] = 6
  node.default['sensu']['version_suffix'] = '.el6'
end

# Install extra packages
node['chef-client-base']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

# install monitoring
include_recipe 'sensu::default'

# Install sensu client plugins
node['chef-client-base']['plugins'].each do |plugin, version|
  # sensu_plugin plugin
  sensu_gem plugin do
    version version
  end
end

# Set up the client configuration
sensu_client node.name do
  address node['ipaddress']
  subscriptions node['chef-client-base']['subscriptions'].uniq
  additional(contacts: node['chef-client-base']['contact'])
end

# setup sudo for sensu
template '/etc/sudoers.d/sensu' do
  source 'sudoers.erb'
  mode '0440'
  owner 'root'
  group 'root'
  variables(
    user: node['chef-client-base']['sensu-user'],
    commands: node['chef-client-base']['sensu-client']['sudocommand']
  )
end

# create folder for standalone checks
directory '/etc/sensu/conf.d/checks' do
  action :create
  owner node['chef-client-base']['sensu-user']
  group node['chef-client-base']['sensu-user']
end

# setup standalone BASE checks
node['chef-client-base']['sensu_base_checks'].each do |checkname|
  sensu_check checkname[0] do
    command "#{checkname[0]}.rb #{checkname[1]}"
    handlers node['chef-client-base']['handlers']
    interval node['chef-client-base']['checktime']
    standalone true
    notifies :restart, 'sensu_service[sensu-client]', :delayed
  end
end

# run client servcies
include_recipe 'sensu::client_service'
