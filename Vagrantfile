# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
  end

  ### CONSUL ###

  config.vm.define "consul1" do |consul1|
    consul1.vm.hostname = "consul1"
    consul1.vm.network "private_network", ip: "10.75.10.10"
    consul1.vm.provision "ansible" do |ansible|
      ansible.playbook = "consul/consul1.yml"
      ansible.extra_vars = {
        ansible_python_interpreter: "/usr/bin/python3",
      }
    end
  end

  config.vm.define "consul2" do |consul2|
    consul2.vm.hostname = "consul2"
    consul2.vm.network "private_network", ip: "10.75.10.11"
    consul2.vm.provision "ansible" do |ansible|
      ansible.playbook = "consul/consul2_3.yml"
      ansible.extra_vars = {
        ansible_python_interpreter: "/usr/bin/python3",
      }
    end
  end

  config.vm.define "consul3" do |consul3|
    consul3.vm.hostname = "consul3"
    consul3.vm.network "private_network", ip: "10.75.10.12"
    consul3.vm.provision "ansible" do |ansible|
      ansible.playbook = "consul/consul2_3.yml"
      ansible.extra_vars = {
        ansible_python_interpreter: "/usr/bin/python3",
      }
    end
  end


  ### NOMAD ###

  config.vm.define "nomad1" do |nomad1|
    nomad1.vm.hostname = "nomad1"
    nomad1.vm.network "private_network", ip: "10.75.10.15"
    nomad1.vm.provision "ansible" do |ansible|
      ansible.playbook = "nomad/nomad.yml"
      ansible.extra_vars = {
        ansible_python_interpreter: "/usr/bin/python3",
      }
    end
  end

  config.vm.define "nomad2" do |nomad2|
    nomad2.vm.hostname = "nomad2"
    nomad2.vm.network "private_network", ip: "10.75.10.16"
    nomad2.vm.provision "ansible" do |ansible|
      ansible.playbook = "nomad/nomad.yml"
      ansible.extra_vars = {
        ansible_python_interpreter: "/usr/bin/python3",
      }
    end
  end


  ### TRAEFIK ###

  config.vm.define "traefik1" do |traefik1|
    traefik1.vm.hostname = "traefik1"
    traefik1.vm.network "private_network", ip: "10.75.10.20"
    traefik1.vm.provision "ansible" do |ansible|
      ansible.playbook = "traefik/traefik.yml"
      ansible.extra_vars = {
        ansible_python_interpreter: "/usr/bin/python3",
      }
    end
  end


  ### VAULT ###

  config.vm.define "vault1" do |vault1|
    vault1.vm.hostname = "vault1"
    vault1.vm.network "private_network", ip: "10.75.10.25"
    vault1.vm.provision "ansible" do |ansible|
      ansible.playbook = "vault/vault.yml"
      ansible.extra_vars = {
        ansible_python_interpreter: "/usr/bin/python3",
      }
    end
  end


  # config.vm.define "nomad2" do |nomad2|
  #   consul3.vm.hostname = "consul3"
  #   consul3.vm.network "private_network", ip: "10.75.10.12"
  #   config.vm.provision "ansible" do |ansible|
  #     ansible.playbook = "consul/consul_server.yml"
  #     ansible.playbook = "consul/consul_join_cluster.yml"
  #     ansible.extra_vars = {
  #       ansible_python_interpreter: "/usr/bin/python3",
  #     }
  #   end
  # end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
