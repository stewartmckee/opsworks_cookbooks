node[:deploy].each do |application, deploy|

  bash "restart web server" do
    user "root"
    code "kill -s USR2 `ps aux | grep \"unicorn_rails master\" | grep -v grep | awk {'print$2'}`"
  end

end
