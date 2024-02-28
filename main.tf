module "Development_server_emacs_jed_git" {
    source = "./Development_server_emacs_jed_git/DevelopmentServerproject1.tf" #2stk_idenne
  }

module "Docker_server2" {
    source = "./Docker_server2"
  }


module "Storage_server_GlusterFS1" {
    source = "./Storage_server_GlusterFS/Gluster1/Gluster1project1.tf"
  }

module "Storage_server_GlusterFS1" {
    source = "./Storage_server_GlusterFS/Gluster2/Gluster2project2.tf"
  }

