include_attribute "cloudfoundry-common"

# Where to install the CloudFoundry code.
default['cloudfoundry_cloud_controller']['vcap']['install_path'] = "/srv/vcap-cloud_controller"

# Repository to use when fetching the CloudFoundry code.
default['cloudfoundry_cloud_controller']['vcap']['repo']         = "https://github.com/cloudfoundry/cloud_controller.git"

# Git reference to use when fetching the CloudFoundry code. Can be
# either a specific sha or a reference such as `HEAD` or `master`.
default['cloudfoundry_cloud_controller']['vcap']['reference']    = "2e7d91bb9130e18c86359e33e02fb5feddceed8b"

# The domain name for your CloudFoundry instance.
default['cloudfoundry_cloud_controller']['server']['domain'] = 'vcap.me'

# The uri that services can use to reach the cloud controller.
default['cloudfoundry_cloud_controller']['server']['api_uri'] = "http://api.#{node.cloudfoundry_cloud_controller.server.domain}"

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

# TODO (trotter): Find out what this means.
default['cloudfoundry_cloud_controller']['server']['use_nginx'] = false

# TODO (trotter): Find out what this means.
default['cloudfoundry_cloud_controller']['server']['insecure_instance_port'] = 9025

# Log level for the CloudFoundry application.
default['cloudfoundry_cloud_controller']['server']['log_level'] = 'info'

# TODO (trotter): Find out how this differes from `rails_log_file`.
default['cloudfoundry_cloud_controller']['server']['log_file'] = "#{node[:cloudfoundry_common][:log_dir]}/cloud_controller.log"

# TODO (trotter): Find out how this differs from `log_file`.
default['cloudfoundry_cloud_controller']['server']['rails_log_file'] = "#{node[:cloudfoundry_common][:log_dir]}/cloud_controller-rails.log"

# TODO (trotter): Find out what this means.
default['cloudfoundry_cloud_controller']['server']['allow_debug'] = true

# TODO (trotter): Find out what this means.
default['cloudfoundry_cloud_controller']['server']['max_current_stagers'] = 10

# TODO (trotter): Find out what this means.
default['cloudfoundry_cloud_controller']['server']['max_staging_runtime'] = 120

# TODO (trotter): Find out what this means.
default['cloudfoundry_cloud_controller']['server']['staging_secure'] = false

# An array containing the email addresses of all server admins.
default['cloudfoundry_cloud_controller']['server']['admins'] = ['you@example.com']

# The name of the database that CloudController will use.
default['cloudfoundry_cloud_controller']['database']['name'] = 'cloud_controller'

# Hostname where CloudController's database is located.
default['cloudfoundry_cloud_controller']['database']['host'] = 'localhost'

# An array containing the name of each framework supported by your
# CloudFoundry instance. Due to a quirk in cloud_controller, you _must_
# have rails3 and sinatra listed as frameworks.
default['cloudfoundry_cloud_controller']['server']['frameworks']['platform']['cookbook'] = "cloudfoundry-cloud_controller::platform"

default['cloudfoundry_cloud_controller']['server']['services'] = [
  'mysql',
  'mongodb',
  'postgresql'
]

# Where to store the pid_file for the CloudController.
default[:cloudfoundry_cloud_controller]['server']['pid_file'] = File.join(node[:cloudfoundry_common][:pid_dir], "cloud_controller.pid")

