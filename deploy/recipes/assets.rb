node[:deploy].each do |application, deploy|
  bash "compress the assets" do
    user "deploy"
    code <<-EOH
      cd #{deploy[:current_path]} && bundle exec rake sass:update &&  bundle exec rake jammit:after_deploy
    EOH
  end
end
