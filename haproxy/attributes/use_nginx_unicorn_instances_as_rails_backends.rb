if node[:scalarium][:instance][:roles].include?('lb') && node[:scalarium][:roles][:nginx_unicorn]
  node[:scalarium][:roles][:nginx_unicorn][:instances].each do |nickname, instance|
    node[:haproxy][:rails_backends] << {'name' => nickname, 'ip' => instance['private_ip'], 'backends' => instance['backends']}
  end
end

