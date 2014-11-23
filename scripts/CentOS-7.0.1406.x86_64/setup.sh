# Sort out DNS issues with centos, vagrant and public networking
echo "PEERDNS=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf

# Vagrant specific
date > /etc/vagrant_box_build_time

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'http://10.0.2.2:8081/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Install virtual box guest addtions
mkdir -p /mnt/virtualbox
mount -o loop /home/vagrant/VBoxGuest*.iso /mnt/virtualbox
sh /mnt/virtualbox/VBoxLinuxAdditions.run
umount /mnt/virtualbox
rm -rf /home/vagrant/VBoxGuest*.iso

# Customize the message of the day
echo 'Welcome to your vagrant virtual machine.' > /etc/motd

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Sync to ensure that the delete completes before this moves on.
sync
