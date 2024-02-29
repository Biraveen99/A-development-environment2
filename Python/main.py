from linux_comands import all_server_list, truncate_ansible_hosts, apply_terraform, append_ips_to_hosts, run_playbook
import os

m

if __name__ == "__main__":

    original_directory = os.getcwd()
    apply_terraform()
    ip_list = all_server_list()
    truncate_ansible_hosts()
    append_ips_to_hosts(ip_list)
    os.chdir(original_directory)
    run_playbook()

   
    