include_recipe "deploy" # get the deployment attributes

node[:deploy].each do |application, deploy|

  redis_server = node[:scalarium][:roles]['db-master'][:instances].keys.first
  redis_server_ip = if redis_server
      node[:scalarium][:roles]['db-master'][:instances][redis_server][:private_ip]
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

  bash "symlink redis config" do
    code <<-EOH
      ln -s -f #{deploy[:deploy_to]}/shared/config/redis.yml #{deploy[:deploy_to]}/current/config/redis.yml
    EOH
    only_if do
      File.directory?("#{deploy[:deploy_to]}/current")
    end
  end

end
