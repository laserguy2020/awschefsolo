#!/bin/bash -x
LOG='/tmp/init.log'
#curl -L https://www.opscode.com/chef/install.sh | sudo bash 
wget  https://www.opscode.com/chef/install.sh -O /root/install.sh &>> $LOG
source /root/install.sh  &>> $LOG
#apt-get update
#apt-get install git -y
mkdir -p /var/chef/cookbooks  &>> $LOG
cd /var/chef/cookbooks 
for i in build-essential openssl mysql ; do git clone https://github.com/opscode-cookbooks/${i}.git  &>> $LOG ; done
#echo ' file_cache_path "/var/chef/cache"
#cookbook_path "/var/chef/cookbooks"
#json_attribs "/var/chef/node.json" ' > /var/chef/solo.rb
cat << EOF >> /var/chef/solo.rb
file_cache_path "/var/chef/cache"
cookbook_path "/var/chef/cookbooks"
json_attribs "/var/chef/node.json"
EOF

#echo ' {
#  "mysql": {
#    "server_root_password": "iloverandompasswordsbutthiswilldo",
#    "server_repl_password": "iloverandompasswordsbutthiswilldo",
#    "server_debian_password": "iloverandompasswordsbutthiswilldo"
#  },
#  "run_list":["recipe[mysql::server]"]
#}' > /var/chef/node.json

cat << EOF >>/var/chef/node.json
{
  "mysql": {
    "server_root_password": "iloverandompasswordsbutthiswilldo",
    "server_repl_password": "iloverandompasswordsbutthiswilldo",
    "server_debian_password": "iloverandompasswordsbutthiswilldo"
  },
  "run_list":["recipe[mysql::server]"]
}
EOF

/usr/bin/chef-solo -c /var/chef/solo.rb &>> $LOG
