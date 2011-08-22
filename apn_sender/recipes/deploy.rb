node[:deploy].each do |application, deploy|

  service "apn_sender_#{application}" do
    action :restart
  end

end
