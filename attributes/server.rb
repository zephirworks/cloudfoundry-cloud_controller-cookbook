# The domain name for your CloudFoundry instance.
default['cloudfoundry_cloud_controller']['server']['domain'] = 'vcap.me'

# The uri that services can use to reach the cloud controller.
default['cloudfoundry_cloud_controller']['server']['api_uri'] = "http://api.#{node['cloudfoundry_cloud_controller']['server']['domain']}"

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

# TODO (trotter): Find out how this differes from `rails_log_file`.
default['cloudfoundry_cloud_controller']['server']['log_file'] = "#{node['cloudfoundry']['log_dir']}/cloud_controller.log"

# TODO (trotter): Find out how this differs from `log_file`.
default['cloudfoundry_cloud_controller']['server']['rails_log_file'] = "#{node['cloudfoundry']['log_dir']}/cloud_controller-rails.log"

# TODO (trotter): Find out what this means.
default['cloudfoundry_cloud_controller']['server']['allow_debug'] = true

# TODO (trotter): Find out what this means.
default['cloudfoundry_cloud_controller']['server']['max_staging_runtime'] = 120

# An array containing the email addresses of all server admins.
default['cloudfoundry_cloud_controller']['server']['admins'] = []

# An array containing the name of each framework supported by your
# CloudFoundry instance. Due to a quirk in cloud_controller, you _must_
# have rails3 and sinatra listed as frameworks.
default['cloudfoundry_cloud_controller']['server']['frameworks']['platform']['cookbook'] = "cloudfoundry-cloud_controller::platform"

default['cloudfoundry_cloud_controller']['server']['services'] = [
  'mysql',
  'mongodb',
  'postgresql'
]

# Set to true to enable the service_proxy service.
default['cloudfoundry_cloud_controller']['server']['service_proxy'] = false

# Where to store the pid_file for the CloudController.
default['cloudfoundry_cloud_controller']['server']['pid_file'] = File.join(node['cloudfoundry']['pid_dir'], "cloud_controller.pid")
