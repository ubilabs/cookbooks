include_recipe "nodejs"

bash "simple install of npm" do
  cwd "/usr/local/src"
  user "root"
  code "curl https://npmjs.org/install.sh | sh"
end
