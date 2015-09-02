node[:deploy].each do |application, deploy|
  bash "change bind address" do
    cwd "/etc/redis"
    code "sed -i 's/bind 127.0.0.1/bind 0.0.0.0' /etc/redis/redis.conf"
  end

end
