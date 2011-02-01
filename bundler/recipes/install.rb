include_recipe "bundler::rubygems"

gem_package "Installing Bundler #{node[:bundler][:version]}" do
  gem_binary node[:bundler][:gem_binary]
  retries 2
  package_name "bundler"
  action :install
  version node[:bundler][:version]
end