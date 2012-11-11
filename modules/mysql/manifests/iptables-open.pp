#
# == Definition: mysql::iptables-open
#
# A helper to open mysql's port, with an optional destination
#
# Example usage:
#   mysql::iptables-open { "10.0.0.1": to => "192.168.1.1" }
#
define mysql::iptables-open ($to=undef) {

  iptables { "open mysql from $name":
    destination => $to,
    dport  => "3306",
    proto  => "tcp",
    source => $name,
    jump   => "ACCEPT",
  }
}
