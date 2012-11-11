include_attribute "cloudfoundry"

# Path to a directory that will hold the cloud_controller code.
default['cloudfoundry_cloud_controller']['vcap']['install_path'] = "/srv/cloud_controller"

# Path to a directory that will hold the cloud_controller data and temporary files.
default['cloudfoundry_cloud_controller']['data_dir'] = ::File.join(node['cloudfoundry']['data_dir'], "cloud_controller")

# Source repository for the cloud\_controller code.
default['cloudfoundry_cloud_controller']['vcap']['repo']         = "https://github.com/cloudfoundry/cloud_controller.git"

# Git reference to use when fetching the CloudFoundry code. Can be
# either a specific sha or a reference such as `HEAD` or `master`.
default['cloudfoundry_cloud_controller']['vcap']['reference']    = "176a030ca4543a3437fa871f8a4dba3fdd1aa207"
