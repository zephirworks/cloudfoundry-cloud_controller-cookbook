include_recipe "postgresql::ruby"

db_connection = {
  :host     => '127.0.0.1',
  :port     => 5432,
  :username => 'postgres',
  :password => node['postgresql']['password']['postgres']
}

postgresql_database_user node['cloudfoundry_cloud_controller']['database']['user'] do
  connection  db_connection
  password    node['cloudfoundry_cloud_controller']['database']['password']
  action      :create
end

postgresql_database node['cloudfoundry_cloud_controller']['database']['name'] do
  connection  db_connection
  owner       node['cloudfoundry_cloud_controller']['database']['user']
  action      :create
end
