#
# Cookbook Name:: cloudfoundry-cloud_controller
# Attributes:: default
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

# Path to a directory that will hold the cloud_controller code.
default['cloudfoundry_cloud_controller']['vcap']['install_path'] = "/srv/cloud_controller"

# Source repository for the cloud\_controller code.
default['cloudfoundry_cloud_controller']['vcap']['repo']         = "https://github.com/cloudfoundry/cloud_controller.git"

# Git reference to use when fetching the CloudFoundry code. Can be
# either a specific sha or a reference such as `HEAD` or `master`.
default['cloudfoundry_cloud_controller']['vcap']['reference']    = "dcc038eebd7c9dfb34ef0130c5b295117ece4d47"
