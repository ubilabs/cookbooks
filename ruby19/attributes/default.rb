default[:ruby19] = {}
default[:ruby19][:version_major] = '1.9.2'
default[:ruby19][:version_minor] = 'p136'
default[:ruby19][:version] = "#{node[:ruby19][:version_major]}-#{node[:ruby19][:version_minor]}"
default[:ruby19][:gems_version] = "1.9.1"
default[:ruby19][:package_name] = "ruby-#{node[:ruby19][:version]}.tar.bz2"
default[:ruby19][:package_url] = "http://ftp.ruby-lang.org//pub/ruby/1.9/#{node[:ruby19][:package_name]}"
default[:ruby19][:target_dir] = "/opt/ruby-#{node[:ruby19][:version]}"
default[:ruby19][:link_dir] = "/opt/ruby"

