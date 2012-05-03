node[:deploy].each do |application, deploy|
  next unless deploy[:application_type] == "rails"

  template "/etc/init.d/resque-scheduler_#{application}" do
    source "resque-scheduler.init.erb"
    owner "root"
    group "root"
    mode "0755"
    variables(:application => application,
              :current_path => deploy[:current_path],
              :rails_env => deploy[:rails_env],
              :app_path => deploy[:deploy_to]
             )
  end

  if node[:resque_scheduler][:monit]
    template "/etc/monit/conf.d/resque-scheduler_#{application}.monitrc" do
      source "resque-scheduler.monit.erb"
      owner "root"
      group "root"
      mode "0644"
      variables(:application => application, :current_path => deploy[:current_path])
    end
    execute "monit reload" do
      action :run
    end
  end

  service "resque-scheduler_#{application}" do
    service_name "resque-scheduler_#{application}"
    supports :start => true, :reload => true, :stop => true, :restart => true
    action [:enable, :start]
  end
end
