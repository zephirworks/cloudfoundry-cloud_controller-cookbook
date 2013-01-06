#
# Cookbook Name:: cloudfoundry-cloud_controller
# Attributes:: server
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

# The welcome message that users will see when first connecting.
default['cloudfoundry_cloud_controller']['server']['welcome'] = "VMWare's Cloud Application Platform"

# Where users should go to get support.
default['cloudfoundry_cloud_controller']['server']['support_address'] = 'http://support.cloudfoundry.com'

# Set whether users can self register to your CloudFoundry Instance.
default['cloudfoundry_cloud_controller']['server']['allow_registration'] = true

# TODO (trotter): Find out what this does.
default['cloudfoundry_cloud_controller']['server']['allow_external_app_uris'] = false

# The external port on which the CloudController is accessible. This
# value normally won't matter, as a CloudFoundry router will front the
# CloudController and serve it at `api.#{hostname}:80`.
default['cloudfoundry_cloud_controller']['server']['external_port'] = 9022

# Log level for the CloudFoundry application.
default['cloudfoundry_cloud_controller']['server']['log_level'] = 'info'

# TODO (trotter): Find out what this means.
default['cloudfoundry_cloud_controller']['server']['allow_debug'] = true

# TODO (trotter): Find out what this means.
default['cloudfoundry_cloud_controller']['server']['max_staging_runtime'] = 120

# An array containing the email addresses of all server admins.
default['cloudfoundry_cloud_controller']['server']['admins'] = []

default['cloudfoundry_cloud_controller']['server']['frameworks'] = {}

default['cloudfoundry_cloud_controller']['server']['services'] = [
  'mysql',
  'mongodb',
  'postgresql'
]

# Set to true to enable the service_proxy service.
default['cloudfoundry_cloud_controller']['server']['service_proxy'] = false

# Set to true to enable the new policy for assigning apps to DEAs.
default['cloudfoundry_cloud_controller']['server']['new_initial_placement'] = true
