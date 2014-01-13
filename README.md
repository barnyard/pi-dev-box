# Pi dev box

## Dependencies

- [VirtualBox](https://www.virtualbox.org)
- [Vagrant](http://www.vagrantup.com/)

## Setup

### Get the code

    git checkout git@github.com:barnyard/pi-dev-box.git
    cd pi-dev-box

### Start the box

    vagrant up

This should download a virtual machine and build it with the puppet manifest in `puppet/manifest/pi.pp`

## Connecting

    vagrant ssh
