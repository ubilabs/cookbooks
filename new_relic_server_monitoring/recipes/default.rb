execute "wget -O /etc/apt/sources.list.d/newrelic.list http://download.newrelic.com/debian/newrelic.list" do
  user "root"
end

execute "apt-key adv --keyserver hkp://subkeys.pgp.net --recv-keys 548C16BF" do
  user "root"
end

execute "apt-get update" do
  user "root"
end

package "newrelic-sysmond"

execute "nrsysmond-config --set license_key=#{node[:new_relic_monitoring][:license_key]}" do
  user "root"
end

service "newrelic-sysmond" do
  action :start
end
