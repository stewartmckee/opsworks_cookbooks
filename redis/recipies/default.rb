node[:deploy].each do |application, deploy|

  template "/etc/redis/redis.conf" do
    source "redis.conf.erb"
  end

  script "install redis" do
    interpreter "bash"
    user "root"
    cwd "/tmp"
    code <<-EOH
      wget http://download.redis.io/releases/redis-3.0.3.tar.gz
      tar -zxf redis-3.0.3.tar.gz
      cd redis-3.0.3
      make install
      make test
    EOH
  end

  bash "start server" do
    user "root"
    code "redis-server /etc/redis/redis.conf"
  end

end
