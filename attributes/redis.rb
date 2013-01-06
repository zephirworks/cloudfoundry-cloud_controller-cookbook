#
# Cookbook Name:: cloudfoundry-cloud_controller
# Attributes:: redis
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

# Port the vcap_redis server will listen to.
default['cloudfoundry_cloud_controller']['redis']['port'] = 5454

# Password for clients to connect to the vcap_redis server.
default['cloudfoundry_cloud_controller']['redis']['password'] = nil
