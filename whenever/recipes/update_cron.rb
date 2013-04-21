#
# Cookbook Name:: whenever
# Recipe:: default
#
 
# Set your application name here
appname = "dailyfarm"
 
if ['solo', 'util'].include?(node[:instance_role])
 
  execute "whenever" do
    cwd "#{deploy_to}/current"
    command "sudo bundle exec whenever --update-crontab '#{appname}'"
    action :run
  end
  
end