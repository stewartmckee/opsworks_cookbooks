node[:deploy].each do |application, deploy|

  bash "start sidekiq" do
    cwd "#{deploy[:deploy_to]}/current"
    code "nohup bundle exec sidekiq -C #{deploy[:deploy_to]}/current/config/sidekiq.yml -e production > #{deploy[:deploy_to]}/current/log/sidekiq.log  2>&1 &"
  end
  
end
