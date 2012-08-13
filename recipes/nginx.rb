node.default['cloudfoundry_cloud_controller']['nginx']['enable'] = true

include_recipe "cloudfoundry-nginx::lua_module"

template File.join(node['nginx']['dir'], "sites-available", "cloud_controller") do
  source "nginx.conf.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  notifies :restart, resources(:service => "nginx")
end

nginx_site "cloud_controller" do
  nxpath File.join(node['nginx']['path'], "sbin")
end

# nginx recipe adds a default site. It gets in our way, so we remove it.
nginx_site "default" do
  nxpath File.join(node['nginx']['path'], "sbin")
  enable false
end
