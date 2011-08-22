node[:deploy].each do |application, deploy|

  template "/etc/init.d/apn_sender_#{application}" do
    source "apn_sender.init.erb"
    owner "root"
    group "root"
    mode "0755"
    variables(:application => application,
              :current_path => deploy[:current_path],
              :rails_env => deploy[:rails_env],
              :app_path => deploy[:deploy_to]
             )
  end

  if node[:apn_sender][:monit]
    template "/etc/monit/conf.d/apn_sender_#{application}.monitrc" do
      source "apn_sender.monit.erb"
      owner "root"
      group "root"
      mode "0644"
      variables(:application => application, :current_path => deploy[:current_path])
    end
    execute "monit reload" do
      action :run
    end
  end

  service "apn_sender_#{application}" do
    service_name "apn_sender_#{application}"
    supports :start => true, :reload => true, :stop => true, :restart => true
    action [:enable, :start]
  end

end
