include_recipe "apache2"
include_recipe "apache2::service"

package "libcurl4-openssl-dev"

execute "Install Passenger Gem with custom Ruby" do
  command "#{node[:passenger_ruby19][:path_to_gem]} install passenger -v #{node[:passenger_ruby19][:version]} --no-rdoc --no-ri"
end

execute "Compile Passenger Apache Module" do
  command "#{node[:passenger_ruby19][:base_path]}//passenger-install-apache2-module -a"
end

template "/etc/apache2/mods-available/passenger.load" do
  source "passenger.load.erb"
  cookbook "passenger_apache2"
  mode 0644
end

template "/etc/apache2/mods-available/passenger.conf" do
  source "passenger.conf.erb"
  cookbook "passenger_apache2"
  mode 0644
end

service "apache2" do
  action :restart
end
