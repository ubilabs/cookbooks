execute "add-apt-repository ppa:arnaud-hartmann/glances-stable" do
  user "root"
end

execute "apt-get update" do
  user "root"
end

package "glances"

