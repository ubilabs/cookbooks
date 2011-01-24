default[:passenger_ruby19][:version] = "3.0.2"

default[:passenger_ruby19][:base_path] = "/opt/ruby/bin/"
default[:passenger_ruby19][:path_to_gem] = "#{passenger_ruby19[:base_path]}/gem"
default[:passenger_ruby19][:path_to_ruby] = "#{passenger_ruby19[:base_path]}/ruby"
default[:passenger_ruby19][:path_to_lib] = "#{passenger_ruby19[:base_path]}/../lib"
default[:passenger_ruby19][:passenger_conf] = "/etc/apache2/mods-available/passenger.conf"
default[:passenger_ruby19][:passenger_load] = "/etc/apache2/mods-available/passenger.load"
