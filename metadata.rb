maintainer       "Trotter Cashion"
maintainer_email "cashion@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures cloudfoundry-cloud_controller"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.99.0"

%w{ ubuntu }.each do |os|
  supports os
end

%w{ cloudfoundry cloudfoundry-nginx database nginx postgresql rbenv }.each do |cb|
  depends cb
end
