terraform {
  required_providers {
   openstack = {
    source = "terraform-provider-openstack/openstack"
  }
 }
}

provider "openstack" {
        cloud = "openstack" # defined in ~C:/Users/Tommy/Desktop/.config/openstack/clouds.yml
}

resource "openstack_compute_instance_v2" "dev_server" {
  count             = 2 # Creates two instances
  name              = "DevServer-${count.index}"
  image_name        = "ubuntu-22.04-LTS"
  flavor_name       = "css.1c1r.10g" # Ensure this matches a single CPU configuration in your OpenStack
  key_pair          = "key"
  security_groups   = ["default"]

  network {
    name = "acit"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.access_ip_v4
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 20",
      "sudo apt update",
      "sudo apt install -y jed", 
      "sudo apt-get install -y git-all",
      "sudo apt install -y emacs"
        ###installing ansible##
      "sudo apt update",
      "sudo apt -y install software-properties-common",
      "sudo apt-add-repository ppa:ansible/ansible -y",
      "sudo apt update",
      "sudo apt install ansible -y",

      # Execute the Ansible playbook
      "ansible-playbook /home/ubuntu/setup_apache_and_user.yml",
    ]
  }
}