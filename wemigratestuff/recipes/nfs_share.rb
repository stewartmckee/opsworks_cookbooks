node[:deploy].each do |application, deploy|

  nfs_export "/mnt/data" do
    network '*'
    writeable true
    sync true
    options ['no_root_squash']
  end

end
