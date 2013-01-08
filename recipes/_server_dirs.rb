#
# Cookbook Name:: cloudfoundry-cloud_controller
# Recipe:: _server_dirs
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

node.default['cloudfoundry_cloud_controller']['data_dir'] = ::File.join(node['cloudfoundry']['data_dir'], "cloud_controller")
node.default['cloudfoundry_cloud_controller']['server']['droplets_dir'] = File.join(node['cloudfoundry_cloud_controller']['data_dir'], "droplets")
node.default['cloudfoundry_cloud_controller']['server']['resources_dir'] = File.join(node['cloudfoundry_cloud_controller']['data_dir'], "resources")
node.default['cloudfoundry_cloud_controller']['server']['staging_manifests_dir'] = File.join(node['cloudfoundry_cloud_controller']['data_dir'], "staging_manifests")
node.default['cloudfoundry_cloud_controller']['server']['tmp_dir'] = File.join(node['cloudfoundry_cloud_controller']['data_dir'], "tmp")

%w[log_dir].each do |d|
  directory node['cloudfoundry'][d] do
    recursive true
    owner node['cloudfoundry']['user']
    group node['cloudfoundry']['group']
    mode  0755
  end
end
%w[data_dir].each do |d|
  directory node['cloudfoundry_cloud_controller'][d] do
    recursive true
    owner node['cloudfoundry']['user']
    group node['cloudfoundry']['group']
    mode  '0755'
  end
end
%w[droplets_dir resources_dir staging_manifests_dir tmp_dir].each do |d|
  directory node['cloudfoundry_cloud_controller']['server'][d] do
    recursive true
    owner node['cloudfoundry']['user']
    group node['cloudfoundry']['group']
    mode  '0755'
  end
end
