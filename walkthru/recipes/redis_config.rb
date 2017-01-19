node[:deploy].each do |application, deploy|

  ruby_block "remove bind line from config" do
    block do
      file = Chef::Util::FileEdit.new("/etc/hosts")
      file.search_file_delete_line("bind 127.0.0.1")
      file.write_file
    end
  end

  bash "restart redis-server" do
    cwd "#{deploy[:deploy_to]}/current"
    user "root"
    code "/etc/init.d/redis-server restart"
  end

end
