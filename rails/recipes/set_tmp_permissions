node[:deploy].each do |application, deploy|
  Chef::Log.info("Setting tmp permissions...")
  directory "#{deploy[:deploy_to]}/current/tmp/cache/assets/production" do
    mode '0777'
    action :create
  end
end
