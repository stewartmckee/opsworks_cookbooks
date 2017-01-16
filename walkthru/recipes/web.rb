node[:deploy].each do |application, deploy|


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

end
