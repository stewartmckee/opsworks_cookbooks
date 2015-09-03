node[:deploy].each do |application, deploy|

  directory "#{deploy[:deploy_to]}/current/tmp/cache/assets/production" do
    action :create
    mode '0777'
  end

end
