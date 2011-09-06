node[:deploy].each do |application, deploy|
  cron "cron for rake task" do
    hour node[:cron][:hour].to_s
    minute node[:cron][:minute].to_s
    command "cd #{deploy[:deploy_to]} && RAILS_ENV=#{deploy[:rails_env]} bundle exec rake #{node[:cron][:command]}"
  end
end
