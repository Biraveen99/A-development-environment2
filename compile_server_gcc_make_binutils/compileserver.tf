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
        "sudo apt-get update",
        "sudo DEBIAN_FRONTEND=noninteractive apt-get install -y gcc", 
        "if [ -f /var/run/reboot-required ]; then sudo shutdown -r +1 'Scheduled reboot after GCC installation'; fi",
        "sudo apt install -y make",
        "sudo apt install -y binutils",

        ]
    }


}

output "compile_server_server_ips" {
  value = openstack_compute_instance_v2.Compile_server.*.access_ip_v4
}
