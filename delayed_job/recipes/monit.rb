# setup Unicorn monit configuration per app
node[:deploy].each do |application, deploy|
  template "/etc/monit/conf.d/delayed_job_#{application}.monitrc" do
    source "delayed_job.monit.erb"
    owner "root"
    group "root"
    mode "0644"
    variables(:application => application, :deploy => deploy)
  end

  execute "monit reload" do
    action :run
  end
end
