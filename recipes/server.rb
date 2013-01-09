#
# Cookbook Name:: cloudfoundry-cloud_controller
# Recipe:: server
#
# Copyright 2012-2013, ZephirWorks
# Copyright 2012, Trotter Cashion
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# Dynamic attributes
#
node.default['cloudfoundry_cloud_controller']['server']['log_file'] = "#{node['cloudfoundry']['log_dir']}/cloud_controller.log"
node.default['cloudfoundry_cloud_controller']['server']['rails_log_file'] = "#{node['cloudfoundry']['log_dir']}/cloud_controller-rails.log"

node.default['cloudfoundry_cloud_controller']['server']['pid_file'] = File.join(node['cloudfoundry']['pid_dir'], "cloud_controller.pid")

node.default['cloudfoundry_cloud_controller']['server']['domain'] = node['cloudfoundry']['domain']
node.default['cloudfoundry_cloud_controller']['server']['external_uri'] = "api.#{node['cloudfoundry_cloud_controller']['server']['domain']}"

#
# Install dependencies
#
include_recipe "cloudfoundry-cloud_controller::_server_deps"
include_recipe "cloudfoundry-cloud_controller::_server_dirs"

#
# Install and configure
#
config_file  = File.join(node['cloudfoundry']['config_dir'], "cloud_controller.yml")
install_path = File.join(node['cloudfoundry_cloud_controller']['vcap']['install_path'], "cloud_controller")
ruby_ver = node['cloudfoundry_cloud_controller']['ruby_version']
ruby_path = ruby_bin_path(ruby_ver)

cloudfoundry_source "cloud_controller" do
  path          node['cloudfoundry_cloud_controller']['vcap']['install_path']
  repository    node['cloudfoundry_cloud_controller']['vcap']['repo']
  reference     node['cloudfoundry_cloud_controller']['vcap']['reference']
  subdirectory  "cloud_controller"
  ruby_version  ruby_ver
end

cloudfoundry_component "cloud_controller" do
  install_path install_path
  ruby_version ruby_ver
  bin_file File.join(install_path, "bin", "cloud_controller")
  pid_file node['cloudfoundry_cloud_controller']['server']['pid_file']
  log_file node['cloudfoundry_cloud_controller']['server']['log_file']
  action        [:create, :enable]
  subscribes    :restart, "cloudfoundry_source[cloud_controller]"
end

template File.join(node['cloudfoundry']['config_dir'], "runtimes.yml") do
  source "runtimes.yml.erb"
  owner node['cloudfoundry']['user']
  group node['cloudfoundry']['group']
  mode 0644
  notifies :restart, "cloudfoundry_component[cloud_controller]"
end

frameworks = {}
cf_runtimes.each do |runtime,info|
  info['frameworks'].each do |framework|
    frameworks[framework] ||= []
    frameworks[framework] << runtime
  end
end

frameworks.each_pair do |framework,runtimes|
  template File.join(node['cloudfoundry_cloud_controller']['server']['staging_manifests_dir'], "#{framework}.yml") do
    source "#{framework}.yml.erb"
    owner node['cloudfoundry']['user']
    group node['cloudfoundry']['group']
    mode 0644
    variables(:runtimes => runtimes)
    notifies :restart, "cloudfoundry_component[cloud_controller]"
  end
end

bash "run cloudfoundry migrations" do
  user node['cloudfoundry']['user']
  cwd  install_path
  code "PATH=\"#{ruby_path}:$PATH\" #{File.join(ruby_path, "bundle")} exec rake db:migrate RAILS_ENV=production CLOUD_CONTROLLER_CONFIG='#{config_file}'"
  subscribes :run, "cloudfoundry_source[cloud_controller]"
  action :nothing
end
