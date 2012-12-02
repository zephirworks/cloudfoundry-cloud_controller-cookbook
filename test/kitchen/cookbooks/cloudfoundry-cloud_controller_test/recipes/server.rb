node.set['postgresql']['password']['postgres'] = 'test-password'

include_recipe "postgresql::server"
include_recipe "cloudfoundry-cloud_controller::database"
include_recipe "nats::server"

chef_gem "cfoundry"

redis = node['redisio']
redis_version = '2.2.15'
location = "#{redis['mirror']}/#{redis['base_name']}#{redis_version}.#{redis['artifact_type']}"
servers = [{'port' => '5454'}]

redisio_install "vcap_redis" do
  version           redis_version
  download_url      location
  default_settings  redis['default_settings']
  servers           servers
end

redisio_service 5454 do
  action [:enable,:start]
end
