#
# Cookbook Name:: whenever
# Recipe:: default
#
 
# Set your application name here
appname = "dailyfarm"
 
if node[:fqdn].include?("floccus")
  node[:deploy].each do |application, deploy|
    
    execute "whenever" do
      cwd "#{deploy[:deploy_to]}/current"
      command "sudo bundle exec whenever --update-crontab '#{appname}'"
      action :run
    end
    
  end
  
end