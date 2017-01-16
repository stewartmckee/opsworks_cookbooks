node[:deploy].each do |application, deploy|

  directory "#{deploy[:deploy_to]}/current/config" do
    action :create
    mode '0777'
  end

  template "#{deploy[:deploy_to]}/current/config/redis.yml" do
    source "redis.yml.erb"
    owner "root"
  end

end
