# chef-client
default['chef_client']['log_file'] = 'chef-client.log'
default['chef_client']['log_dir'] = '/var/log/'
default['chef_client']['logrotate']['rotate'] = 1
default['chef_client']['logrotate']['frequency'] = 'daily'
default['chef_client_updater']['version'] = '2.5.3'
default['chef_client_updater']['product'] = 'chefdk'
# default['chef_client']['config'] = {
#   'ssl_verify_mode' => ':verify_peer',
# }

# docker monitoring
default['chef-client-base']['docker']['monitoring'] = 'false'

default['chef-client-base']['plugins'] = {
  'sensu-plugin' => '2.5.0',
  'sensu-plugins-cpu-checks' => '2.1.0',
  'sensu-plugins-disk-checks' => '3.0.1',
  'sensu-plugins-load-checks' => '4.0.2',
  'sensu-plugins-memory-checks' => '3.2.0',
  'sensu-plugins-network-checks' => '3.1.1',
  'sensu-plugins-process-checks' => '3.0.2',
  'sensu-plugins-docker' => '3.0.0',
}

# cookbook attributes
default['chef-client-base']['sensu_base_ruby_path'] = '/opt/sensu/embedded/bin/ruby'
default['chef-client-base']['sensu_base_reset'] = 60
default['chef-client-base']['contact'] = 'support'
default['chef-client-base']['checktime'] = 60
default['chef-client-base']['subscriptions'] = %w(base)
default['chef-client-base']['sensu_base_checks'] = [
  ['check-memory', ' -w 500 -c 100 -p'],
  ['check-disk-usage', ' -w 80 -c 90'],
  ['check-load'],
  ['check-memory-percent', '-w 80 -c 90'],
  ['metrics-disk'],
  ['metrics-disk-usage'],
  ['metrics-cpu'],
  ['metrics-cpu-pcnt-usage'],
  ['metrics-memory'],
  ['metrics-interface'],
  ['metrics-disk-capacity'],
]

# docker sensu checks
default['chef-client-base']['docker']['sensu_checks'] = [
  ['check-docker-container', '-h /run/docker.sock -w 1 -c 1'],
  # ['check-container', '-h /run/docker.sock -c jenkins'],
  ['metrics-docker-stats', '-p unix -H /var/run/docker.sock'],
]

# Sensu Monitoring
default['chef-client-base']['sensu-client']['sudocommand'] = 'ALL'
default['chef-client-base']['sensu-user'] = 'sensu'

# Sensu install/config
default['sensu']['version'] = '1.2.1-2'
default['sensu']['rabbitmq']['host'] = ''
default['sensu']['use_ssl'] = false
default['sensu']['use_embedded_ruby'] = true

# packages for sensu
default['chef-client-base']['packages'] = %w(g++ git make)
