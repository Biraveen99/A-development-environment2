module "Development_server_emacs_jed_git" {
    source = "./Development_server_emacs_jed_git" #2stk_idenne
  }

module "Docker_server2" {
    source = "./Docker_server2"
  }


module "Storage_server_GlusterFS1" {
    source = "./Storage_server_GlusterFS"
  }


