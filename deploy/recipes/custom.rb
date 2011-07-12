include_recipe "rails"

node[:deploy].each do |application, deploy|

  scalarium_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  scalarium_rails do
    deploy_data deploy
    app application
  end

  scalarium_deploy do
    deploy_data deploy
    app application
  end
end
