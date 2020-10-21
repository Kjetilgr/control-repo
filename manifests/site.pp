node default {
  notify { "Oops Default! I'm ${facts['hostname']}": }
}
node 'win.node.consul' {
  include ::profile::base_windows
  include ::profile::dns::client
}
node /lin\d?.node.consul/ {
  include ::profile::base_linux
  include ::profile::dns::client
  include ::profile::consul::client
}
node /(manager|mon).node.consul/ {
  include ::profile::base_linux
  include ::profile::dns::client
  include ::profile::consul::server
}
node 'dir.node.consul' {
  include ::profile::base_linux
  include ::profile::dns::client
  include ::profile::dns::server
  include ::profile::consul::server
}

