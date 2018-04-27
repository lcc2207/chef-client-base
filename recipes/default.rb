# we use ChefDK this updates just the chef-client
# chef_client_updater 'Install updated and kill' do
#   product_name node['chef_client_updater']['product']
#   version node['chef_client_updater']['version']
#   post_install_action 'kill'
# end

# setup the chef-client
include_recipe 'chef-client::default'
include_recipe 'chef-client::delete_validation'
# include_recipe 'chef-client::config'
include_recipe 'chef-client-base::base_monitoring'
