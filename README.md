Description
===========

Install the Cloud Foundry [cloud_controller](https://github.com/cloudfoundry/cloud_controller),
a mandatory component of a [Cloud Foundry](http://www.cloudfoundry.org)
installation.

The cloud_controller is a relatively complex piece of software with several
prerequisites; the deployment architecture can also vary. This cookbook tries
to handle several scenarios and to cater to different use cases (e.g. development,
staging or production cloud); read the documentation carefully to understand the
purpose of each recipe and the different options that are available.

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
* cloudfoundry-nginx
* database
* mysql
* postgresql

Attributes
==========

default
-------

* `node['cloudfoundry_cloud_controller']['vcap']['install_path']` - Path to a directory that will hold the cloud_controller code. Defaults to `/srv/cloud_controller`.
* `node['cloudfoundry_cloud_controller']['data_dir']` - Path to a directory that will hold the cloud_controller data and temporary files. Defaults to `::File.join(node['cloudfoundry']['data_dir'], "cloud_controller")`, which is usually `/var/vcap/data/cloud_controller`.
* `node['cloudfoundry_cloud_controller']['vcap']['repo']` - Source repository for the cloud\_controller code. Defaults to `https://github.com/cloudfoundry/cloud_controller.git`.
* `node['cloudfoundry_cloud_controller']['vcap']['reference']` - Git reference to use when fetching the CloudFoundry code. Can be either a specific sha or a reference such as `HEAD` or `master`. Defaults to  `176a030ca4543a3437fa871f8a4dba3fdd1aa207`.

server
------

* `node['cloudfoundry_cloud_controller']['server']['domain']` - The domain name for your CloudFoundry instance. Defaults to `vcap.me'`.
* `node['cloudfoundry_cloud_controller']['server']['welcome']` - The welcome message that users will see when first connecting. Defaults to `VMWare's Cloud Application Platform"`.
* `node['cloudfoundry_cloud_controller']['server']['support_address']` - Where users should go to get support. Defaults to `http://support.cloudfoundry.com'`.
* `node['cloudfoundry_cloud_controller']['server']['allow_registration']` - Set whether users can self register to your CloudFoundry Instance. Defaults to `true`.
* `node['cloudfoundry_cloud_controller']['server']['allow_external_app_uris']` - TODO (trotter): Find out what this does. Defaults to `false`.
* `node['cloudfoundry_cloud_controller']['server']['external_port']` - The external port on which the CloudController is accessible. This value normally won't matter, as a CloudFoundry router will front the CloudController and serve it at `api.#{hostname}:80`. Defaults to `9022`.
* `node['cloudfoundry_cloud_controller']['server']['log_level']` - Log level for the CloudFoundry application. Defaults to `info'`.
* `node['cloudfoundry_cloud_controller']['server']['log_file']` - TODO (trotter): Find out how this differes from `rails_log_file`. Defaults to `#{node['cloudfoundry']['log_dir']}/cloud_controller.log"`.
* `node['cloudfoundry_cloud_controller']['server']['rails_log_file']` - TODO (trotter): Find out how this differs from `log_file`. Defaults to `#{node['cloudfoundry']['log_dir']}/cloud_controller-rails.log"`.
* `node['cloudfoundry_cloud_controller']['server']['allow_debug']` - TODO (trotter): Find out what this means. Defaults to `true`.
* `node['cloudfoundry_cloud_controller']['server']['max_staging_runtime']` - TODO (trotter): Find out what this means. Defaults to `120`.
* `node['cloudfoundry_cloud_controller']['server']['admins']` - An array containing the email addresses of all server admins. Defaults to `[]`.
* `node['cloudfoundry_cloud_controller']['server']['runtimes']` - An array of hashes containing the `name` and `version` for each runtime available in your CloudFoundry instance. XXX (trotter): Not sure we can store hashes in an attribute. Will have to test this part thoroughly. Defaults to `[`.
* `node['cloudfoundry_cloud_controller']['server']['frameworks']` - An array containing the name of each framework supported by your CloudFoundry instance. Due to a quirk in cloud_controller, you _must_ have rails3 and sinatra listed as frameworks. Defaults to `[`.
* `node['cloudfoundry_cloud_controller']['server']['service_proxy']` - Set to true to enable the service_proxy service. Defaults to `false`.
* `node['cloudfoundry_cloud_controller']['server']['pid_file']` - Where to store the pid_file for the CloudController. Defaults to `File.join(node['cloudfoundry']['pid_dir'], "cloud_controller.pid")`.
* `node['cloudfoundry_cloud_controller']['server']['droplets_dir']` - Path to a directory that will hold the staged droplets. Defaults to `"#{node.default['cloudfoundry']['shared_dir']}/droplets"`.
* `node['cloudfoundry_cloud_controller']['server']['resources_dir']` - Path to a directory that will hold a copy of all uploaded files for de-duplication. Defaults to `"#{node.default['cloudfoundry']['shared_dir']}/resources"`.
* `node['cloudfoundry_cloud_controller']['server']['staging_manifests_dir']` - Path to a directory that will hold staging manifest files.. Defaults to `"#{node.default['cloudfoundry']['shared_dir']}/staging_manifests"`.
* `node['cloudfoundry_cloud_controller']['server']['tmp_dir']` - Path to a directory that will hold the temporary files, such as uploaded applications. Defaults to `"#{node.default['cloudfoundry']['shared_dir']}/tmp"`.
* `node['cloudfoundry_cloud_controller']['server']['new_initial_placement']` -
  Set to true to enable the new policy for assigning apps to DEAs. Defaults to
  `true`.

database
--------

* `node['cloudfoundry_cloud_controller']['database']['name']` - The name of the database that CloudController will use. Defaults to `cloud_controller'`.
* `node['cloudfoundry_cloud_controller']['database']['user']` - The user to use when authenticatin to the database server. Defaults to `cloudfoundry'`.
* `node['cloudfoundry_cloud_controller']['database']['password']` - The password to use when authenticatin to the database server. Defaults to `cloudfoundry'`.

nginx
-----

* `node['cloudfoundry_cloud_controller']['nginx']['enable']` - Set to true to enable nginx in fron of the cloud_controller. Defaults to false.
* `node['cloudfoundry_cloud_controller']['nginx']['instance_socket']` - Path to the socket to use for communication between nginx and the CloudController. Defaults to `/tmp/cloud_controller.sock'`.

Recipes
=======

server
------

Install a cloud_controller on the target node along with the necessary
configuration files and init scripts to run it.

The cloud_controller requires access to a Nats, a PostgreSQL and a Redis
server; these can run on the same or a different node. The default settings
are for a self-contained node running all the services.

In particular, if running a Chef client (non-solo), the recipe will:

* search for a Nats server with a `cloudfoundry_nats_server` role in the
same Chef environment; if found, it will use attributes from that node to
build the connection URL;
* assume a PostgreSQL server is running on the same node (FIXME);
* search for a Redis server with a `cloudfoundry_redis_vcap` role in the
same Chef environment. If found, it will use the IP address of that node; the
configuration can be fine-tuned with `cloud_controller`-specific attributes
(see above);

If a service is not found via search, or if running a Chef Solo, the recipe will:

* assume the Nats server is running on the same node; it will use the attributes
from the `nats_server` cookbook (see the documentation for that cookbook for more
information);
* assume a Redis server is running on the same node.

database
--------

Creates a PostgreSQL user and database for the `cloud_controller` to use.

You should run this recipe on the node that holds the database.

default
-------

nginx
-----


Usage
=====

Deploy `cloud_controller` and all its requirements on a single node:

    run_list: "recipe[postgresql::server]",
              "recipe[cloudfoundry-cloud_controller::database]",
              "recipe[nats::server]",
              "recipe[cloudfoundry-cloud_controller::server]"

License and Author
==================

Author:: Andrea Campi (<andrea.campi@zephirworks.com>)
Author:: Trotter Cashion (<cashion@gmail.com>)

Copyright:: 2012-2013 ZephirWorks
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
