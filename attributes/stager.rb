# Set to true to enable the new stager.
default['cloudfoundry_cloud_controller']['stager']['enable'] = false

# How many apps to stage using the new starger, as a percentage (from 0% to 100%).
default['cloudfoundry_cloud_controller']['stager']['percent'] = 100

# If set, only these users will be allowed to use the new stager.
default['cloudfoundry_cloud_controller']['stager']['email_regexp'] = nil

# When calling back into the cloud_controller, the stager will authenticate with this username.
default['cloudfoundry_cloud_controller']['stager']['user'] = 'user'

# When calling back into the cloud_controller, the stager will authenticate with this password.
default['cloudfoundry_cloud_controller']['stager']['password'] = 'password'
