# SIC!
gem_package "net-ssh" do
  action :install
  options "--no-rdoc --no-ri -v 2.1.4"
end
gem_package "fog" do
  action :install
  options "--no-rdoc --no-ri -v 0.11.0"
end

bash "install `ec2-consistent-snapshot`" do
  code <<-EOH
    add-apt-repository ppa:alestic && apt-get update && apt-get install -y ec2-consistent-snapshot
  EOH
end

node[:deploy].each do |application, deploy|
  template node[:ebs_snapshot][:backup_script] do
    source "ebs_snapshot.erb"
    mode 0755
    variables(
      :application => application,
      :instance_id => node[:scalarium][:instance][:aws_instance_id],
      :mysql_root_password => node[:mysql][:server_root_password],
      :num_snapshots_to_keep => node[:ebs_snapshot][:num_snapshots_to_keep],
      :access_key_id => node[:amazon][:access_key_id],
      :secret_access_key => node[:amazon][:secret_access_key],
      :region => node[:amazon][:region])
  end
end

cron "Create EBS Snapshot" do
  hour node[:ebs_snapshot][:cron][:hours]
  minute node[:ebs_snapshot][:cron][:minutes]
  command node[:ebs_snapshot][:backup_script]
end
