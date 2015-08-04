
node[:deploy].each do |application, deploy|
  Chef::Log.info("Precompiling assets...")
  execute "rake assets:precompile" do
    cwd "#{deploy[:deploy_to]}/current"
    command "bundle exec rake assets:precompile"
  end
end
