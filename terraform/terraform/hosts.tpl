[hosts]
bastion ansible_host=${bastion_instance_ip} ansible_user=root working_directory=/root/
hetzner ansible_host=${hetzner_server_ip} ansible_user=root working_directory=/root/
hetzner2 ansible_host=${hetzner_server_2_ip} ansible_user=root working_directory=/root/
hetzner3 ansible_host=${hetzner_server_3_ip} ansible_user=root working_directory=/root/

[hosts:vars]
ansible_python_interpreter=/usr/bin/python3
