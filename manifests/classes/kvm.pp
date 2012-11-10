# have some functions do deal with virtual machines
class kvm {
    package { ["qemu-kvm", "python-vm-builder", "ubuntu-vm-builder", "libvirt-bin", "bridge-utils", "lvm2"]:
        ensure => latest,
    }

    file { "/root/run-puppet-at-boot":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/root/run-puppet-at-boot",
    }
    
    file { "/root/add-serial-to-grub":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/root/add-serial-to-grub",
    }
    
    file { "/etc/libvirt/qemu/autostart":
        ensure  => directory,
    }
    
    sysctl::value { "net.ipv4.ip_forward":
        value   => "1",
    }
    
    sysctl::value { "net.ipv6.conf.all.forwarding":
        value   => "1",
    }

    package { ["virt-goodies"]:
        ensure  => latest,
    }

}

define kvm::virtual_machine ($fqdn, $ip, $netmask, $dns="8.8.8.8", $gateway, $memory, $rootsize, $disksize, $bridge, $ensure, $container) {
    case $ensure {
        present: {
            exec { "create_vm_${name}": 
                path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",  
                timeout => 3600,
                command => "lvcreate -n $name -L ${disksize}G ${container}; virsh destroy ${fqdn}; virsh undefine ${fqdn}; \
                /usr/bin/vmbuilder \
                kvm ubuntu  --raw /dev/mapper/${container}-$name -v -m $memory --cpus=1 --rootsize=$rootsize \
                --swapsize=512 --domain=ring.nlnog.net --ip=$ip --mask=$netmask --gw=$gateway --dns=$dns \
                --hostname=$fqdn --suite=precise \
                --libvirt=qemu:///system \
                --components=main,restricted,universe,multiverse \
                --debug \
                --verbose \
                --timezone=UTC \
                --lang=en_US.UTF-8 \
                --tmpfs=- \
                --addpkg=puppet \
                --addpkg=openssh-server \
                --addpkg=dnsutils \
                --addpkg=traceroute \
                --addpkg=vim \
                --bridge=$bridge \
                --execscript=/root/add-serial-to-grub \
                --firstboot=/root/run-puppet-at-boot \
                  && virsh start $fqdn && virsh autostart ${fqdn}; rm -rf  ubuntu-kvm ",
            unless => "/usr/bin/test -L /dev/mapper/${container}-$name",
            }
    
#            file { "/etc/init/ttyS0.conf":
#                owner   => root,
#                group   => root,
#                mode    => 0755,
#                source  => "puppet:///files/etc/init/ttyS0.conf",
#            }
        }
        absent: {
            exec { "destroy_vm_${name}":
                path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                timeout => 3600,
                command => "virsh destroy $fqdn; virsh undefine $fqdn; sleep 10; lvremove -f /dev/mapper/${container}-$name",
            }
            @@exec { "clean_cert_on_master_${name}":
                path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                timeout => 3600,
                command => "puppetca --clean ${fqdn}",
                tag     => "destroy_virtual_machines",
            }
            @@exec { "clean_storedconfigs_on_master_${name}":
                path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                timeout => 3600,
                command => "puppet node clean ${fqdn}",
                tag     => "destroy_virtual_machines",
            }
            file { "/etc/libvirt/qemu/autostart/${fqdn}.xml":
                ensure  => absent,
            }
        }
        default: {
            fail "Invalid 'ensure' value '$ensure' for kvm::virtual_machine"
        }
    }
}
