# have some functions do deal with virtual machines
class kvm {
    package { ["qemu-kvm", "python-vm-builder", "ubuntu-vm-builder", "libvirt-bin", "bridge-utils"]:
        ensure => latest,
    }

    file { "/root/run-puppet-at-boot":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/root/run-puppet-at-boot",
    }
}

define kvm::virtual_machine ($fqdn, $ip, $netmask, $dns="8.8.8.8", $gateway, $memory, $rootsize, $disksize, $bridge, $ensure) {
    case $ensure {
        present: {
            exec {"create_vm_${name}": 
            path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",  
            timeout => 3600,
            command => "lvcreate -n $name -L ${disksize}G container01; virsh destroy $name; virsh undefine $name ; \
                /usr/bin/vmbuilder \
                kvm ubuntu  --raw /dev/mapper/container01-$name -v -m $memory --cpus=1 --rootsize=$rootsize \
                --swapsize=512 --domain=ring.nlnog.net --ip=$ip --mask=$netmask --gw=$gateway --dns=$dns \
                --hostname=$fqdn --suite=precise \
                --rootpass=password --libvirt=qemu:///system \
                --components=main,restricted,universe,multiverse \
                --debug \
                --verbose \
                --timezone=UTC \
                --lang=en_US.UTF-8 \
                --tmpfs=- \
                --addpkg=puppet \
                --addpkg=openssh-server \
                --addpkg=traceroute \
                --addpkg=vim \
                --bridge=$bridge \
                --firstboot=/root/run-puppet-at-boot \
                  && virsh start $fqdn; rm -rf  ubuntu-kvm ",
            unless => "/usr/bin/test -L /dev/mapper/container01-$name",
        }
        }
        absent: {
            exec { "destroy_vm_${name}":
                path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                timeout => 3600,
                command => "virsh destroy $fqdn; virsh undefine $fqdn; sleep 10; lvremove -f /dev/mapper/container01-$name",
            }
            @@exec { "clean_cert_on_master_${name}":
                path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                timeout => 3600,
                command => "puppetca --clean ${fqdn}",
                tag     => "destroyed_virtual_machines",
            }
        }
        default: {
            fail "Invalid 'ensure' value '$ensure' for kvm::virtual_machine"
        }
    }
}
