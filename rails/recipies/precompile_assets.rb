
Chef::Log.info("Precompiling assets")
execute "rake assets:precompile" do
  cwd release_path
  command "bundle exec rake assets:precompile"
end
