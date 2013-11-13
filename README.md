Here are the files which you can use to privision the amazon instance with cloud init service using chef-solo 

Start the instance using
aws ec2 run-instances --image-id ami-8e987ef9 --key-name key_name --instance-type t1.micro --user-data file://chef-solo.yaml
or
uncomment the apt-get lines in chef-solo_log.sh and type
aws ec2 run-instances --image-id ami-8e987ef9 --key-name key_name --instance-type t1.micro --user-data file://chef-solo_log.sh

Connect via ssh and enjoy looking at the log at /tmp/init.log 
