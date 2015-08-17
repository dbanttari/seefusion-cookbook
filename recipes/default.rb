#
# Cookbook Name:: seefusion-cookbook
# Recipe:: default
#
# Copyright 2015, Daryl Banttari
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

if defined?(node['tomcat']['config_dir'])
  node.default.seefusion['lib_dir'] = node['tomcat']['lib_dir']
  node.default.seefusion['config_dir'] = node['tomcat']['config_dir']
  include_recipe 'seefusion::tomcat'
#elsif defined?(node['coldfusion9'])
elsif defined?(node['cf10'])
  node.default.seefusion['lib_dir'] = "#{node['cf10']['installer']['install_folder']}/cfusion/runtime/lib"
  node.default.seefusion['config_dir'] = "#{node['cf10']['installer']['install_folder']}/cfusion/runtime/conf"
  include_recipe 'seefusion::tomcat'
  service 'coldfusion' do
  	action :restart
  	not_if "java -jar #{node['seefusion']['lib_dir']}/seefusion.jar --is-installed tomcat #{node['seefusion']['config_dir']}"
  end
else
  Chef::Application.fatal!("Unable to autodetect where to install SeeFusion.  Please set  node['seefusion']['lib_dir'] / node['seefusion']['config_dir'] and call the correct recipe directly.")
end