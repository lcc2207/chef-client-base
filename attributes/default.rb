# chef-client
default['chef_client']['log_file'] = 'chef-client.log'
default['chef_client']['log_dir'] = '/var/log/'
default['chef_client']['logrotate']['rotate'] = 1
default['chef_client']['logrotate']['frequency'] = 'daily'
default['chef_client_updater']['version'] = '13.6.4'


# cookbook attributes
default['chef-client-base']['sensu_base_ruby_path'] = '/opt/sensu/embedded/bin/ruby'
default['chef-client-base']['postgresql']['db_password'] = nil
default['chef-client-base']['sensu_checks'] = []
default['chef-client-base']['sensu_base_reset'] = 120
default['chef-client-base']['contact'] = 'support'
default['chef-client-base']['checktime'] = 120
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
  ['check-ntp', '-w 100'],
]

# Sensu Monitoring
default['chef-client-base']['sensu-client']['sudocommand'] = 'ALL'
default['chef-client-base']['sensu-user'] = 'sensu'

# need a standard internal repo for all these (to reduse the code)
default['chef-client-base']['plugins'] = %w(https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-disk-checks/master/bin/metrics-disk.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-disk-checks/master/bin/metrics-disk-usage.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-cpu-checks/master/bin/metrics-cpu.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-cpu-checks/master/bin/metrics-cpu-pcnt-usage.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-memory-checks/master/bin/metrics-memory.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-network-checks/master/bin/metrics-interface.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-disk-checks/master/bin/check-disk-usage.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-load-checks/master/bin/check-load.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-memory-checks/master/bin/check-memory-percent.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-memory-checks/master/bin/check-memory-percent.sh
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-memory-checks/master/bin/check-memory.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-memory-checks/master/bin/check-memory.sh
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-disk-checks/master/bin/check-disk-usage.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-disk-checks/master/bin/metrics-disk-capacity.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-postgres/master/bin/check-postgres-connections.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-postgres/master/bin/metric-postgres-dbsize.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-postgres/master/bin/metric-postgres-statsio.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-ntp/master/bin/check-ntp.rb
                                          https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-http/master/bin/check-http.rb)

# base sensu gems
default['chef-client-base']['gems'] = %w(sensu-plugin sys-filesystem sensu-plugins-load-checks sensu-plugins-http)

# packages for sensu
default['chef-client-base']['packages'] = %w(gcc gcc-c++ git)

# Sensu install/config
default['sensu']['version'] = '1.2.0-1'
default['sensu']['rabbitmq']['host'] = ''
default['sensu']['use_ssl'] = false
default['sensu']['use_embedded_ruby'] = true
