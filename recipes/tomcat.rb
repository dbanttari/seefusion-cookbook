remote_file "#{node['seefusion']['lib_dir']}/seefusion.jar" do
  source node['seefusion']['src']
  mode '0644'
  action :create
  sensitive true
end

execute 'Install SeeFusion' do
  command "java -jar #{node['seefusion']['lib_dir']}/seefusion.jar --install tomcat #{node['seefusion']['config_dir']}"
  # the not_if won't work because the Tomcat cookbook rewrites the config, and what's seen during the Compile phase
  # (when the not_if runs) won't match what's there when we get back here during the Converge phase
  #not_if "java -jar #{node['seefusion']['lib_dir']}/seefusion.jar --is-installed tomcat #{node['seefusion']['config_dir']}"
end

template "#{node['seefusion']['lib_dir']}/seefusion.xml" do
  source 'seefusion.xml.erb'
  mode '0644'
end
