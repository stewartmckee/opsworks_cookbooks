name              "walkthru"
maintainer        "Active Information Design"
maintainer_email  "support@activeinformationdesign.com"
license           "Apache 2.0"
description       "Installs and configures wemigratestuff"
version           "1.1.2"

recipe "walkthru", "Installs nginx package and sets up configuration with Debian apache style with sites-enabled/sites-available"
recipe "nginx::source", "Installs nginx from source and sets up configuration with Debian apache style with sites-enabled/sites-available"

%w{ ubuntu debian }.each do |os|
 supports os
end
