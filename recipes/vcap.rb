git node['cloudfoundry_cloud_controller']['vcap']['install_path'] do
  repository        node['cloudfoundry_cloud_controller']['vcap']['repo']
  reference         node['cloudfoundry_cloud_controller']['vcap']['reference']
  user              "root"
  action :sync
  notifies :restart, "service[cloudfoundry-cloud_controller]"
end
