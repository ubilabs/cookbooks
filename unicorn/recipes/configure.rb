template "#{release_path}/config/unicorn.rb" do
  source "unicorn.rb.erb"
  owner "root"
  group "root"
  mode "0644"
end

