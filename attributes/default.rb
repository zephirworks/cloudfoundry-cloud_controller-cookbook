include_attribute "cloudfoundry"

# Where to install the CloudFoundry code.
default['cloudfoundry_cloud_controller']['vcap']['install_path'] = "/srv/vcap-cloud_controller"

# Repository to use when fetching the CloudFoundry code.
default['cloudfoundry_cloud_controller']['vcap']['repo']         = "https://github.com/cloudfoundry/cloud_controller.git"

# Git reference to use when fetching the CloudFoundry code. Can be
# either a specific sha or a reference such as `HEAD` or `master`.
default['cloudfoundry_cloud_controller']['vcap']['reference']    = "176a030ca4543a3437fa871f8a4dba3fdd1aa207"

# TODO (trotter): Find out what this does.
default['cloudfoundry_cloud_controller']['tmpdir'] = "/var/vcap/data/cloud_controller/tmp"

# TODO (trotter): Find out what this does.
default['cloudfoundry_cloud_controller']['platform_cache_dir'] = "/var/vcap/data/platform/cache"
