
Vagrant.configure("2") do |config|
  config.vm.box = "generic/debian12" 
  config.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end 
  # Jumpbox
  config.vm.define "jumpbox" do |jumpbox|
    jumpbox.vm.hostname = "jumpbox"
    jumpbox.vm.network "private_network", ip: "10.240.0.10"
    jumpbox.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
  end

  # Control Plane (Server)
  config.vm.define "server" do |server|
    server.vm.hostname = "server"
    server.vm.network "private_network", ip: "10.240.0.11"
    server.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 1
    end
  end

  config.vm.define "node-0" do |node_0|
    node_0.vm.hostname = "node-0"
    node_0.vm.network "private_network", ip: "10.240.0.20"
    node_0.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 1
    end
  end

  # Worker Node 1
  config.vm.define "node-1" do |node_1|
    node_1.vm.hostname = "node-1"
    node_1.vm.network "private_network", ip: "10.240.0.21"
    node_1.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 1
    end
  end

  config.vm.provision "shell", inline: <<-SHELL
    echo "root:vagrant" | chpasswd
    sed -i 's/^#*PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
    sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
    systemctl restart sshd
  SHELL
end