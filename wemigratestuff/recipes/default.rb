node[:deploy].each do |application, deploy|

  template "#{deploy[:deploy_to]}/current/config/redis.yml" do
    source "redis.yml.erb"
    owner "root"
  end

end
