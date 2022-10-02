[hosts]
amazon ansible_host=${ec2_instance_ip} ansible_user=ubuntu working_directory=/home/ubuntu/
lightsail ansible_host=${lightsail_instance_ip} ansible_user=ubuntu working_directory=/home/ubuntu/
digitalocean ansible_host=${digitalocean_droplet_ip} ansible_user=root working_directory=/home/ubuntu/
google ansible_host=${google_instance_ip} ansible_user=ohcan2 working_directory=/home/ubuntu/
azure ansible_host=${azure_vm_ip} ansible_user=adminuser working_directory=/home/ubuntu/

[hosts:vars]
ansible_python_interpreter=/usr/bin/python3
