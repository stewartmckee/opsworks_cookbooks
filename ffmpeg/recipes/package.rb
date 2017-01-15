

bash "add source" do
  user "root"
  code "sudo add-apt-repository ppa:mc3man/trusty-media -y"
end

bash "update apt" do
  user "root"
  code "sudo apt-get update"
end

package "ffmpeg" do
  action :install
end
