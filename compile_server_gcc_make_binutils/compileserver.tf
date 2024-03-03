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

resource "openstack_compute_instance_v2" "Compile_server" {
  count             = 2 # Creates two instances
  name              = "compile_server-${count.index}"
  image_name        = "ubuntu-22.04-LTS"
  flavor_name       = "css.1c1r.10g" # Ensure this matches a single CPU configuration in your OpenStack
  key_pair          = "masterKey"
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
      "sudo apt install gcc make binutils -y",
      "sudo apt intall emacs jed git -y",
    ]
  }
}

output "compile_server_server_ips" {
  value = openstack_compute_instance_v2.Compile_server.*.access_ip_v4
}
