node[:deploy].each do |application, deploy|

  # nfs_server_ip = node["opsworks"]["layers"]["nfs_server"]["instances"].map{|instance_name, instance_config| instance_config["private_ip"]}.first

  # directory "/mnt/data" do
  #   user "root"
  # end

  # mount "/mnt/data" do
  #   device "#{nfs_server_ip}:/mnt/data"
  #   fstype 'nfs'
  #   options "rw"
  #   action :mount
  # end

  # link "#{deploy[:deploy_to]}/current/store" do
  #   owner "deploy"
  #   group "www-data"
  #   to "/mnt/data"
  #   # to "#{deploy[:deploy_to]}/shared/store"
  # end

  bash "stop sidekiq" do
    user "root"
    code "kill -s TERM `ps aux | grep \"sidekiq\" | grep -v grep | awk {'print$2'}`"
    only_if "ps aux | grep \"sidekiq\" | grep -v grep"
  end

  bash "start sidekiq" do
    cwd "#{deploy[:deploy_to]}/current"
    code "nohup bundle exec sidekiq -C #{deploy[:deploy_to]}/current/config/sidekiq.yml -e production > #{deploy[:deploy_to]}/current/log/sidekiq.log  2>&1 &"
  end

end
