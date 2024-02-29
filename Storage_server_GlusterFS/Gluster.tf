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



resource "openstack_compute_instance_v2" "glusterfs_server_1" {
  count             = 2 # Creates two instances
  name              = "glusterfs-server-${count.index}"
  image_name        = "Ubuntu-22.04-LTS"
  flavor_name       = "css.2c4r.10g"
  key_pair          = "masterKey"
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

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y software-properties-common",
      "sudo add-apt-repository -y ppa:gluster/glusterfs-9",
      "sudo apt update",
      "sudo apt install -y glusterfs-server",
      "sudo systemctl start glusterd",
      "sudo systemctl enable glusterd",
    ]
  }
}


output "glusterfs_server_ips" {
  value = openstack_compute_instance_v2.glusterfs_server_1.*.access_ip_v4
}
