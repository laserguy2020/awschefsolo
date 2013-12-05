## Provision Amazon instances using chef-solo
Here are the files which you can use to provision the amazon instances with cloud init service using chef-solo.
<br> They install chef client and necessary files to get Mysql server at the end. </br>

There are two ways to use them:
* 1. Start using yaml 
<code>aws ec2 run-instances --image-id ami-8e987ef9 --key-name key_name --instance-type t1.micro --user-data file://chef-solo.yaml</code>
* 2. or using plain bash script (uncomment the apt-get lines in chef-solo_log.sh)
<code>aws ec2 run-instances --image-id ami-8e987ef9 --key-name key_name --instance-type t1.micro --user-data file://chef-solo_log.sh </code>

Connect via ssh and enjoy looking at the log file /tmp/init.log 

Files:
* chef-solo_log.sh  - bash script with one way of logging (exec and tee ) 
* chef-solo_log2.sh  - bash script with another way of logging ("&>> log_file" - after every command)
