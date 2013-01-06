#
# Cookbook Name:: cloudfoundry-cloud_controller
# Attributes:: stager
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

# When calling back into the cloud_controller, the stager will authenticate with this username.
default['cloudfoundry_cloud_controller']['stager']['user'] = 'user'

# When calling back into the cloud_controller, the stager will authenticate with this password.
default['cloudfoundry_cloud_controller']['stager']['password'] = 'password'
