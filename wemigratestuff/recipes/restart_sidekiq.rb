node[:deploy].each do |application, deploy|

  bash "restart sidekiq" do
    user "root"
    code "kill -s USR2 `ps aux | grep \"sidekiq\" | grep -v grep | awk {'print$2'}`"
  end

end
