node[:deploy].each do |application, deploy|

  directory "#{deploy[:deploy_to]}/current/tmp/cache/assets/production" do
    action :create
    mode '0777'
  end

  bash "restart unicorn" do
    user "root"
    code "kill -s USR2 `ps aux | grep \"unicorn_rails master\" | grep -v grep | awk {'print$2'}`"
  end

end
