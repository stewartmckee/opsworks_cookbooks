node[:deploy].each do |application, deploy|

  template "#{deploy[:deploy_to]}/current/config/redis.yml" do
    source "redis.yml.erb"
    owner "root"
  end

  directory "#{deploy[:deploy_to]}/current/tmp/cache/assets/production" do
    action :create
    mode '0777'
  end
  
end
