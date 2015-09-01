node[:deploy].each do |application, deploy|

  bash "start sidekiq"
    cwd "#{deploy[:deploy_to]}/current"
    code "nohup bundle exec sidekiq -C #{deploy[:deploy_to]}/current/config/sidekiq.yml -e production 2>&1 &"
  end

end
