# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$username = ""
$timeout = "36000"
$email = ""
$password = ""

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions/20161207.0.0/providers/virtualbox.box"

  config.vm.define "bluemix", primary: true do |bluemix|
    bluemix.vm.box = "trusty64"
    bluemix.vm.hostname = "bluemix.local"
    bluemix.vm.network :private_network, ip: "192.168.56.70"
    bluemix.vm.synced_folder "src", "/data/bluemix/src", type: "nfs"
    bluemix.vm.synced_folder "~/.ssh", "/data/user/ssh"
    bluemix.vm.provider :virtualbox do |vb|
      vb.name = "bluemix"
      vb.customize ["modifyvm", :id, "--memory", "256"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      vb.customize ["modifyvm", :id, "--name", "bluemix.local"]
    end

    bluemix.hostsupdater.aliases = ["bluemix.local"]

    bluemix.vm.provision 'shell' do |shell|
      shell.inline = "sudo rm -f /etc/resolv.conf"
      shell.inline = "sudo echo 'nameserver 8.8.4.4' >> /etc/resolv.conf"
      shell.inline = "sudo echo 'nameserver 8.8.8.8' >> /etc/resolv.conf"
      shell.inline = "sudo sed -i 's/^127\.0\.1\.1/127\.0\.0\.1/' /etc/hosts"
    end

    # setup git
    bluemix.vm.provision 'shell' do |shell|
      shell.keep_color = true
      shell.path = 'provision/scripts/git_manager.sh'
      shell.privileged = false
      shell.args = [$timeout, $username, $email, $password]
    end

    bluemix.vm.provision :ansible do |ansible|
      ansible.playbook = "bluemix.yml"
      ansible.inventory_path = "development"
      ansible.limit = "app"
      ansible.sudo = true
      ansible.verbose = "v"
    end

    # setup cloudFoundry
    bluemix.vm.provision 'shell' do |shell|
      shell.keep_color = true
      shell.path = 'provision/scripts/bootstrap.sh'
      shell.privileged = false
      shell.args = [$email, $password]
    end
  end
end
