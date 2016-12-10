bluemix-disconnected-control-command
================================================================================
The project goal is to automatically deploy the configuration needed for an operational bluemix environment.

This project involves the use of IBM's Watson artificial intelligence tools.

pre-reqs
================================================================================
To run at all, you will need to have a [bluemix](https://console.ng.bluemix.net/registration/?target=%2Fdashboard%2Fapps) account.

Software on host

    vagrant 1.8.5
    ansible 2.1.1.0
    python 2.7.12
    virtualbox 5.1.4r110228

supported systems

    We currently support Linux and macOS.

vagrant plugins

    sahara (0.0.17)
    vagrant-ansible-local (0.0.2)
    vagrant-env (0.0.3)
    vagrant-gatling-rsync (0.9.0)
    vagrant-guestip (0.2)
    vagrant-host-shell (0.0.4)
    vagrant-hostmanager (1.8.5)
    vagrant-hosts (2.8.0)
    vagrant-hosts-provisioner (2.0)
    vagrant-hostsupdater (1.0.2)
    vagrant-list (0.0.6)
    vagrant-multi-hostsupdater (0.0.6)
    vagrant-proxyconf (1.5.2)
    vagrant-reload (0.0.1)
    vagrant-rsync (0.2.5)
    vagrant-share (1.1.6)
    vagrant-triggers (0.5.3)
    vagrant-vbguest (0.13.0)
    vagrant-vbox-snapshot (0.0.10)

quick start
================================================================================

0. Clone repository

    git clone git@github.com:logorn/bluemix_provision_disconnected_control_command.git deploy

1. change Vagrantfile defaut template by your data

    $username = "bdbdbdbdh dhddj"
    
    $timeout = "36000"
    
    $email = "mon@email.com"
    
    $password = "@monMotdepasse"

2. Record and execute command

    vagrant up

3. Open url [bluemix](bluemix.local) from your browser. The following message should appear "Service Unavailable"

   curl [bluemix](bluemix.local)

4. Acces vm through the ssh connection

    vagrant ssh

5. Inside  the guest operating system, setup projet dependencies

    cd /data/bluemix/src/DisconnectedControlCommand
    npm install

6. Start your server:

    node app.js

7. You can now check fallowing url : [bluemix](bluemix.local) with your browser, you should see your app working

    curl [bluemix](bluemix.local)

technical incident
================================================================================

In case of problem, just start with the command on host

    vagrant provision # provisionning guest machine

To destroy virtual machine and provisionning

    vagrant destroy
    vagrant up
    
license
================================================================================

Apache License, Version 2.0

<http://www.apache.org/licenses/LICENSE-2.0.html>
