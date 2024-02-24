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

resource "openstack_compute_instance_v2" "master2_instance" {
    name = "master2"
    image_name = "Ubuntu-22.04-LTS"
    flavor_name = "css.2c4r.10g"
    key_pair = "Bira_mac_key"
    security_groups = ["default"]

    network {
    name = "acit"
    }

    connection {
     type = "ssh"
     user = "ubuntu"
     private_key = "${file("~/.ssh/id_rsa")}"
     host = self.access_ip_v4
    }

    provisioner "file" {
    source      = "/Users/biraveennedunchelian/Desktop/info ops/tries/setup_apache_and_user.yml"
    destination = "/home/ubuntu/setup_apache_and_user.yml"
    }


    provisioner "remote-exec" {
        inline = [
        "sleep 20",
        "curl -LO https://apt.puppet.com/puppet8-release-jammy.deb",
        "sudo dpkg -i ./puppet8-release-jammy.deb",
        "sudo apt install -y puppetserver",
        "sudo apt update",
        "sudo apt install -y python3-openstackclient",
        "wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg",
        "echo deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com/ $(lsb_release -cs) main | sudo tee /etc/apt/sources.list.d/hashicorp.list",
        "sudo apt update && sudo apt install terraform",
        "sudo mkdir -p /home/ubuntu/.config/openstack",
        "sudo chown ubuntu: /home/ubuntu/.config/openstack",
        "sudo apt -y install software-properties-common",
        "sudo apt-add-repository ppa:ansible/ansible -y",
        "sudo apt install ansible -y",
        
        # Execute the Ansible playbook
        "ansible-playbook /home/ubuntu/setup_apache_and_user.yml",
        ]
    }

    provisioner "file" {
        source = "/Users/biraveennedunchelian/.config/openstack/clouds.yaml"
        destination ="/home/ubuntu/.config/openstack/clouds.yaml"
       }
   }