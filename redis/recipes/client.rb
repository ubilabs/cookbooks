node[:deploy].each do |application, deploy|
  next unless deploy[:application_type] == "rails"

  redis_server = node[:opsworks][:layers]['db-master'][:instances].keys.first
  redis_server_ip = if redis_server
      node[:opsworks][:layers]['db-master'][:instances][redis_server][:private_ip]
    else
      "127.0.0.1"
    end
  redis_host = "#{redis_server_ip}:#{node[:redis][:port]}"

  template "#{deploy[:deploy_to]}/shared/config/redis.yml" do
    source "redis.yml.erb"
    mode "0660"
    owner deploy[:user]
    group deploy[:group]
    variables(:host => redis_host)
  end
end
