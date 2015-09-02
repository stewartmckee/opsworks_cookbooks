node[:deploy].each do |application, deploy|

  script "install libgit2" do
    interpreter "bash"
    user "root"
    cwd "/tmp"
    code <<-EOH
      wget https://github.com/libgit2/libgit2/archive/v0.23.1.tar.gz
      tar -zxf v0.23.1.tar.gz
      cd libgit2-0.23.1
      mkdir build && cd build
      cmake ..
      cmake --build . --target install
    EOH
  end

end
