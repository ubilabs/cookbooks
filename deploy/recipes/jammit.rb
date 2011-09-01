node[:deploy].each do |application, deploy|
  bash "compress the assets" do
    user "deploy"
    code <<-EOH
      cd #{deploy[:current_path]} && RAILS_ENV=#{deploy[:rails_env]} bundle exec rake jammit:after_deploy
    EOH
  end
end

