#
# Cookbook Name:: hadoop
# Recipe:: default
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

include_recipe "java"

remote_file "/tmp/hadoop_1.0.3-1_i386.deb" do
  source "http://ftp.halifax.rwth-aachen.de/apache/hadoop/common/hadoop-1.0.3/hadoop_1.0.3-1_i386.deb"
end

dpkg_package "hadoop" do
  case node[:platform]
  when "debian","ubuntu"
    package_name "hadoop"
    source "/tmp/hadoop_1.0.3-1_i386.deb"
  end
  action :install
end

package "hadoop"

