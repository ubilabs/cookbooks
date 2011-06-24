default[:unicorn] = {}
default[:unicorn][:config] = "#{current_release}/config/unicorn.rb"
default[:unicorn][:base_port] = 4000
default[:unicorn][:worker_processes] = 4

