nginx Mash.new unless attribute?("nginx")

nginx[:unicorn][:base_port] = 4000
nginx[:unicorn][:worker_processes] = 4

