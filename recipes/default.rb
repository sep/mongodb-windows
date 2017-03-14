# Install Mongo from location = INSTALLLOCATION

installation_dir = node['mongodb-windows']['installation-dir']
installer_path = node['mongodb-windows']['installer-path']

directory installation_dir do 
  action :create
  recursive true
end

package 'mongodb 2.6.12' do 
  source installer_path
  installer_type :msi
  options "/l*v c:/chef/mongo-msi.log INSTALLLOCATION=\"#{installation_dir}\""
end

directory "#{installation_dir}\\log" do 
  action :create
end

directory "#{installation_dir}\\data" do
  action :create
  recursive true
end

batch "Update Path with Mongo DB bin" do 
  code "setx path \"%PATH%;#{installation_dir}\\bin\""
end

batch "Install Mongo DB as a service" do 
  code <<-EOH 
    #{installation_dir}\\bin\\mongod.exe --logpath=#{installation_dir}\\log\\mongo.log --dbpath=#{installation_dir}\\data --install
    net start MongoDB
  EOH
end
