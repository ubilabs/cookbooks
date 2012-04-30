cron "Redis: rewrite append-only file" do
  minute  "0"
  hour    node[:redis][:compact_at]
  day     node[:redis][:compact_every_x_days]
  month   '*'
  weekday '*'
  command "#{node[:redis][:prefix]}/bin/redis-cli bgrewriteaof"
  user "root"
  path "/usr/bin:/usr/local/bin:/bin"
end
