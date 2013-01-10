#
# Cookbook Name:: cloudfoundry-cloud_controller
# Libraries:: cloud_controller_database
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

def cloud_controller_database
  if Chef::Config[:solo]
    return cloud_controller_database_from_attrs
  end

  ccdb_role = node['cloudfoundry']['roles']['cloud_controller_database_master']
  unless ccdb_role
    return cloud_controller_database_from_attrs
  end

  results = search(:node, "roles:#{ccdb_role} AND chef_environment:#{node.chef_environment}")
  unless results.any?
    Chef::Log.warn "No CCDB found with a search for roles:#{ccdb_role}"
    return cloud_controller_database_from_attrs
  end

  if results.count > 1
    Chef::Log.warn "More than one CCDB found with a search for roles:#{ccdb_role}, picking the first"
  end
  ccdb = results[0]

  cloud_controller_database_from_attrs(ccdb)
end

def cloud_controller_database_from_attrs(n = node)
  host = if n == node
    n['cloudfoundry_cloud_controller']['database']['host']
  else
    n.attribute?('cloud') ? n['cloud']['local_ipv4'] : n['ipaddress']
  end

  {
    :host => host,
    :port => 5432,
    :name => n['cloudfoundry_cloud_controller']['database']['name'],
    :user => n['cloudfoundry_cloud_controller']['database']['user'],
    :password => n['cloudfoundry_cloud_controller']['database']['password']
  }
end
