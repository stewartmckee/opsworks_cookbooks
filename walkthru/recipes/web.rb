node[:deploy].each do |application, deploy|

  directory "#{deploy[:deploy_to]}/current/tmp/cache/assets/production" do
    action :create
    mode '0777'
  end

  node[:deploy].each do |application, deploy|
    Chef::Log.info("Precompiling assets...")
    execute "rake assets:precompile" do
      cwd "#{deploy[:deploy_to]}/current"
      command "RAILS_ENV=production bundle exec rake assets:precompile"
    end
  end

  node[:deploy].each do |application, deploy|
    Chef::Log.info("Cleaning assets...")
    execute "rake assets:clean" do
      cwd "#{deploy[:deploy_to]}/current"
      command "RAILS_ENV=production bundle exec rake assets:clean"
    end
  end

  bash "restart unicorn" do
    user "root"
    code "kill -s USR2 `ps aux | grep \"unicorn_rails master\" | grep -v grep | awk {'print$2'}`"
  end

end
