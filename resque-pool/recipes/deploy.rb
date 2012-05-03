node[:deploy].each do |application, deploy|
  next unless deploy[:application_type] == "rails"

  service "resque-pool_#{application}" do
    action :restart
  end
end
