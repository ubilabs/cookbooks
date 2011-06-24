template "#{node[:unicorn][:config]}" do
  source "unicorn.rb.erb"
  owner "root"
  group "root"
  mode "0644"
end

