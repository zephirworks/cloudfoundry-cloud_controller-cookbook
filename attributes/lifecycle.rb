#
# Cookbook Name:: cloudfoundry-cloud_controller
# Attributes:: lifecycle
#
# Copyright 2013, ZephirWorks
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

default['cloudfoundry_cloud_controller']['lifecycle']['enable'] = true
default['cloudfoundry_cloud_controller']['lifecycle']['max_upload_size'] = 1  # in MB
default['cloudfoundry_cloud_controller']['lifecycle']['upload_token'] = 'dlfoosecret'
default['cloudfoundry_cloud_controller']['lifecycle']['upload_timeout'] = 60  # in seconds
