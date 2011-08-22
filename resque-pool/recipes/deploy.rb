node[:deploy].each do |application, deploy|

  service "resque-pool_#{application}" do
    action :restart
  end

end
