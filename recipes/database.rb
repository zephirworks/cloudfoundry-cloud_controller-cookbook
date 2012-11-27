#
# Cookbook Name:: cloudfoundry-cloud_controller
# Recipes:: database
#
# Copyright 2012, ZephirWorks
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

unless is_pg_buggy?(node)
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
else
  log "Sorry, cloudfoundry_cloud_controller::database is not supported on this platform; " +
      "falling back to running psql"

  execute "create database user #{db_attrs['user']}" do
    command         "createuser -DRS #{db_attrs['user']}"
    user            "postgres"
    ignore_failure  true
  end

  execute "create database user #{db_attrs['user']}" do
    command "echo \"ALTER USER #{db_attrs['password']} with password '#{db_attrs['password']}';\" | psql"
    user    "postgres"
  end

  execute "create database #{db_attrs['name']}" do
    command         "createdb -O#{db_attrs['user']} #{db_attrs['name']}"
    user            "postgres"
    ignore_failure  true
  end
end
