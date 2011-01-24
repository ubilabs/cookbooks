gem_package 'rails' do
  version node[:rails][:version]
  gem_binary "#{node[:rails][:gem_binary]}"
  retries 2
end
