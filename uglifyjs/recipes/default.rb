include_recipe "nodejs"
include_recipe "nodejs::npm"

bash "install uglify-js via npm" do
  user "root"
  code <<-EOH
    npm install uglify-js
  EOH
end
