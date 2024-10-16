[hosts]
azure ansible_host=${azure_vm_ip} ansible_user=adminuser working_directory=/home/ubuntu/
bastion ansible_host=${bastion_instance_ip} ansible_user=ubuntu working_directory=/home/ubuntu/
lightsail ansible_host=${lightsail_instance_ip} ansible_user=ubuntu working_directory=/home/ubuntu/
digitalocean ansible_host=${digitalocean_droplet_ip} ansible_user=root working_directory=/home/ubuntu/
hetzner ansible_host=${hetzner_server_ip} ansible_user=root working_directory=/root/
hetzner2 ansible_host=${hetzner_server_2_ip} ansible_user=root working_directory=/root/

[hosts:vars]
ansible_python_interpreter=/usr/bin/python3
