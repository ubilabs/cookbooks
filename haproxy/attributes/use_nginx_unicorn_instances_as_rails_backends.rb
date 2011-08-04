if node[:scalarium][:instance][:roles].include?('lb') && node[:scalarium][:roles][:nginx_unicorn]
  node[:scalarium][:roles][:nginx_unicorn][:instances].each do |nickname, instance|
    unless node[:haproxy][:rails_backends].include?(backend = {'name' => nickname, 'ip' => instance['private_ip'], 'backends' => instance['backends']})
      node[:haproxy][:rails_backends] << backend
    end
  end
end
