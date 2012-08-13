# Set to true to enable nginx in fron of the cloud_controller.
default['cloudfoundry_cloud_controller']['nginx']['enable'] = false

# Path to the socket to use for communication between nginx and the CloudController.
default['cloudfoundry_cloud_controller']['nginx']['instance_socket']    = '/tmp/cloud_controller.sock'
