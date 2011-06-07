package "build-essential"
package "bison"
package "openssl"
package "libreadline6"
package "curl"
package "git-core"
package "zlib1g"
package "zlib1g-dev"
package "libssl-dev"
package "libyaml-dev"
package "libsqlite3-0"
package "libsqlite3-dev"
package "sqlite3"
package "libxml2-dev"
package "libxslt1-dev"
package "autoconf"

bash "install rvm" do
  user "root"
  code <<-EOH
    bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
    [[ -s "#{node[:rvm][:install_dir]}/scripts/rvm" ]] && source "#{node[:rvm][:install_dir]}/scripts/rvm"
    rvm install #{node[:rvm][:install_ruby_version]}
    rvm --default use #{node[:rvm][:install_ruby_version]}
  EOH
  only_if { Dir.glob("#{node[:rvm][:install_dir]}/rubies/ruby-#{node[:rvm][:install_ruby_version]}*").empty? }
end
