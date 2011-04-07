bash "aktivate mod_expires" do
  user "root"
  code <<-EOH
    a2enmod expires
    /etc/init.d/apache2 restart
  EOH
end
