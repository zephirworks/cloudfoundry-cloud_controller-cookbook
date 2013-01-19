name             "cloudfoundry-cloud_controller"
maintainer       "Andrea Campi"
maintainer_email "andrea.campi@zephirworks.com"
license          "Apache 2.0"
description      "Installs/Configures cloudfoundry-cloud_controller"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.3.5"

%w{ ubuntu }.each do |os|
  supports os
end

%w{ database postgresql rbenv }.each do |cb|
  depends cb
end

depends "cloudfoundry", "~> 1.3.0"
depends "cloudfoundry-nginx", "~> 1.0.2"
