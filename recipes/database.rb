#
# Cookbook Name:: cloudfoundry-cloud_controller
# Recipes:: database
#
# Copyright 2012-2013, ZephirWorks
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

db_attrs = node['cloudfoundry_cloud_controller']['database']

include_recipe "postgresql::ruby"

db_connection = {
  :host     => '127.0.0.1',
  :port     => 5432,
  :username => 'postgres',
  :password => node['postgresql']['password']['postgres']
}

postgresql_database_user db_attrs['user'] do
  connection  db_connection
  password    db_attrs['password']
  action      :create
end

postgresql_database db_attrs['name'] do
  connection  db_connection
  owner       db_attrs['user']
  action      :create
end
