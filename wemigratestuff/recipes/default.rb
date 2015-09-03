node[:deploy].each do |application, deploy|

  template "#{deploy[:deploy_to]}/current/config/redis.yml" do
    source "redis.yml.erb"
    owner "root"
  end

  # // TEMP SETUP FOR STORING CONTENT

  directory "#{deploy[:deploy_to]}/shared/store" do
    action :create
    mode '0777'
  end

  link "#{deploy[:deploy_to]}/current/store" do
    owner "deploy"
    group "www-data"
    to "#{deploy[:deploy_to]}/shared/store"
  end
end
