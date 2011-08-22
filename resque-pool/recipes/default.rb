node[:deploy].each do |application, deploy|

  template "/etc/init.d/resque-pool_#{application}" do
    source "resque-pool.init.erb"
    owner "root"
    group "root"
    mode "0755"
    variables(:application => application,
              :current_path => deploy[:current_path],
              :rails_env => deploy[:rails_env],
              :app_path => deploy[:deploy_to]
             )
  end

  if node[:resque_pool][:monit]
    template "/etc/monit/conf.d/resque-pool_#{application}.monitrc" do
      source "resque-pool.monit.erb"
      owner "root"
      group "root"
      mode "0644"
      variables(:application => application, :current_path => deploy[:current_path])
    end
    execute "monit reload" do
      action :run
    end
  end

  service "resque-pool_#{application}" do
    service_name "resque-pool_#{application}"
    supports :start => true, :reload => true, :stop => true, :restart => true
    action [:enable, :start]
  end

end
