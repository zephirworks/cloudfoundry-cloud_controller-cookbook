Description
===========

Installs and configures CloudFoundry CloudController

Requirements
============

Platform
--------

* Ubuntu

Tested on:

* Ubuntu 10.04
* Ubuntu 12.04

Cookbooks
---------

* cloudfoundry
* database
* mysql
* nginx
* postgresql

Attributes
==========

* `node['cloudfoundry_cloud_controller']['server']['domain']` - The domain name for your CloudFoundry instance. Default is `vcap.me'`.
* `node['cloudfoundry_cloud_controller']['server']['welcome']` - The welcome message that users will see when first connecting. Default is `VMWare's Cloud Application Platform"`.
* `node['cloudfoundry_cloud_controller']['server']['support_address']` - Where users should go to get support. Default is `http://support.cloudfoundry.com'`.
* `node['cloudfoundry_cloud_controller']['server']['allow_registration']` - Set whether users can self register to your CloudFoundry Instance. Default is `true`.
* `node['cloudfoundry_cloud_controller']['server']['allow_external_app_uris']` - TODO (trotter): Find out what this does. Default is `false`.
* `node['cloudfoundry_cloud_controller']['server']['external_port']` - The external port on which the CloudController is accessible. This value normally won't matter, as a CloudFoundry router will front the CloudController and serve it at `api.#{hostname}:80`. Default is `9022`.
* `node['cloudfoundry_cloud_controller']['server']['insecure_instance_port']` - TODO (trotter): Find out what this means. Default is `9025`.
* `node['cloudfoundry_cloud_controller']['server']['log_level']` - Log level for the CloudFoundry application. Default is `info'`.
* `node['cloudfoundry_cloud_controller']['server']['log_file']` - TODO (trotter): Find out how this differes from `rails_log_file`. Default is `#{node['cloudfoundry']['log_dir']}/cloud_controller.log"`.
* `node['cloudfoundry_cloud_controller']['server']['rails_log_file']` - TODO (trotter): Find out how this differs from `log_file`. Default is `#{node['cloudfoundry']['log_dir']}/cloud_controller-rails.log"`.
* `node['cloudfoundry_cloud_controller']['server']['allow_debug']` - TODO (trotter): Find out what this means. Default is `true`.
* `node['cloudfoundry_cloud_controller']['server']['max_staging_runtime']` - TODO (trotter): Find out what this means. Default is `120`.
* `node['cloudfoundry_cloud_controller']['server']['admins']` - An array containing the email addresses of all server admins. Default is `['you@example.com']`.
* `node['cloudfoundry_cloud_controller']['server']['runtimes']` - An array of hashes containing the `name` and `version` for each runtime available in your CloudFoundry instance. XXX (trotter): Not sure we can store hashes in an attribute. Will have to test this part thoroughly. Default is `[`.
* `node['cloudfoundry_cloud_controller']['server']['frameworks']` - An array containing the name of each framework supported by your CloudFoundry instance. Due to a quirk in cloud_controller, you _must_ have rails3 and sinatra listed as frameworks. Default is `[`.
* `node['cloudfoundry_cloud_controller']['server']['pid_file']` - Where to store the pid_file for the CloudController. Default is `File.join(node['cloudfoundry']['pid_dir'], "cloud_controller.pid")`.

database
--------

* `node['cloudfoundry_cloud_controller']['database']['name']` - The name of the database that CloudController will use. Defaults to `cloud_controller'`.
* `node['cloudfoundry_cloud_controller']['database']['host']` - Hostname where CloudController's database is located. Defaults to `localhost'`.

nginx
-----

* `node['cloudfoundry_cloud_controller']['nginx']['enable']` - Set to true to enable nginx in fron of the cloud_controller. Defaults to false.
* `node['cloudfoundry_cloud_controller']['nginx']['instance_socket']` - Path to the socket to use for communication between nginx and the CloudController. Defaults to `/tmp/cloud_controller.sock'`.

Usage
=====

This cookbook contains two components, `cloud_controller::server` and
`cloud_controller::database`. The default recipe runs both recipes.

`cloud_controller::database` is responsible for installing postgres and
setting up a database with the proper permissions. To use it on a
database node:

    include_recipe "cloud_controller::database"

`cloud_controller::server` will install a CloudController on the target
node along with the necessary configuration files and init scripts to
run it. To use it within your recipes:

    include_recipe "cloud_controller::server"

License and Author
==================

Author:: Andrea Campi (<andrea.campi@zephirworks.com>)
Author:: Trotter Cashion (<cashion@gmail.com>)

Copyright:: 2012 ZephirWorks
Copyright:: 2012 Trotter Cashion

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
