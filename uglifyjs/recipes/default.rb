bash "install uglify-js via npm" do
  user "root"
  code <<-EOH
    npm install uglify-js
  EOH
end
