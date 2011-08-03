node[:deploy].each do |application, deploy|

  template "/etc/init.d/unicorn_#{application}" do
    source "unicorn.init.erb"
    owner "root"
    group "root"
    mode "0755"
    variables(:application => application,
              :current_path => deploy[:current_path],
              :rails_env => deploy[:rails_env],
              :app_path => deploy[:deploy_to]
             )
  end

  service "unicorn_#{application}" do
    service_name "unicorn_#{application}"

    supports :start => true, :stop => true, :restart => true, :reload => true
    action :enable
  end


end

