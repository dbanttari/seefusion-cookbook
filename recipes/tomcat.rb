remote_file "#{node['seefusion']['lib_dir']}/seefusion.jar" do
  source node['seefusion']['src']
  mode '0644'
  action :create
  sensitive true
end

execute 'Install SeeFusion' do
  command "java -jar #{node['seefusion']['lib_dir']}/seefusion.jar --install tomcat #{node['seefusion']['config_dir']}"
  #not_if "java -jar #{node['seefusion']['lib_dir']}/seefusion.jar --is-installed tomcat #{node['seefusion']['config_dir']}"
end

template "#{node['seefusion']['lib_dir']}/seefusion.xml" do
  source 'seefusion.xml.erb'
  mode '0644'
end
