
default[:ffmpeg][:install_method] = "source"

default[:ffmpeg][:version] = "3.2.2"
default[:ffmpeg][:source_url] = "http://ffmpeg.org/releases/ffmpeg-#{default[:ffmpeg][:version]}.tar.gz"
default[:ffmpeg][:source_prefix] = "/opt"
