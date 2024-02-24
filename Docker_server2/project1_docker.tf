terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

provider "openstack" {
  cloud = "openstack" # defined in /Users/biraveennedunchelian/.config/openstack/clouds.yaml
}

resource "openstack_compute_instance_v2" "docker_server" {
  name              = "DockerServer"
  image_name        = "Ubuntu-22.04-LTS"
  flavor_name       = "css.2c4r.10g"
  key_pair          = "Bira_mac_key"
  security_groups   = ["default"]

  network {
    name = "acit"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
    host        = self.access_ip_v4
    }

    provisioner "file" { 
      ##send_playbook##
     source      = "/Users/biraveennedunchelian/Desktop/info ops/project1/Playbooks/users.yml"
     destination = "/home/ubuntu/setup_apache_and_user.yml"
    }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository -y \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "sudo apt update",
      "sudo apt install -y docker-ce docker-ce-cli containerd.io",
      
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
