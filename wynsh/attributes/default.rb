#project specific defaults
default[:unicorn] = {}
default[:unicorn][:config] = "#{application_path}/current/config/unicorn.rb"
default[:unicorn][:base_port] = 4000
default[:unicorn][:worker_processes] = 4

default[:nginx][:wynsh_config] = "/etc/nginx/sites-enabled/nginx-wynsh.com"

