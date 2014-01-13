# Pi dev box

## Dependencies

- [VirtualBox](https://www.virtualbox.org)
- [Vagrant](http://www.vagrantup.com/)

## Setup

### Get the code

    git checkout git@github.com:barnyard/pi-dev-box.git
    cd pi-dev-box

### Start the box

The following should download a virtual machine and build it with the puppet manifest in `puppet/manifest/pi.pp`

    vagrant up

If you've already created the machine but there have been changes to Puppet, run the following:

    vagrant provision

## Connecting

    vagrant ssh
