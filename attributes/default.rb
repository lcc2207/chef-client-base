# chef-client
default['chef_client']['log_file'] = 'chef-client.log'
default['chef_client']['log_dir'] = '/var/log/'
default['chef_client']['logrotate']['rotate'] = 1
default['chef_client']['logrotate']['frequency'] = 'daily'
default['chef_client_updater']['version'] = '13.6.4'
