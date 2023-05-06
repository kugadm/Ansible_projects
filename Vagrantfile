# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'

nodes =[
{ :hostname => 'node22', :ip => '192.168.121.23', :network => 'vagrant-libvirt',  :memory => 2096, :cpu => 2, :boxname => "generic/ubuntu2204" },
]
 
Vagrant.configure("2") do |config|
  nodes.each do |node|
  config.vm.box_check_update = false
  config.vm.define node[:hostname] do |nodeconfig|
  nodeconfig.vm.box = node[:boxname] 
  nodeconfig.vm.hostname = node[:hostname]
  nodeconfig.vm.network :private_network, ip: node[:ip], libvirt__network_name: node[:network]
  nodeconfig.vm.provider :libvirt do |domain|
    domain.memory = node[:memory]
    domain.cpus = node[:cpu]
    

  config.vm.provision "ansible" do |ansible|
    ansible.limit = "all" 
    ansible.galaxy_role_file = "requirements.yml"
    ansible.galaxy_roles_path = './roles'
    ansible.galaxy_command = 'ansible-galaxy install --role-file=%{role_file} --roles-path=%{roles_path}'
    ansible.playbook = "playbooks/playbook_vagrant.yml"
    ansible.raw_arguments  = "--ask-vault-pass"
    ansible.inventory_path = "environments/dev"

  
    end
  end
end
end
end


