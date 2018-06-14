storage "consul" {
  address = "127.0.0.1:8500"
  path    = "vault/"
}

listener "tcp" {
 address     = "{{ ansible_enp0s8.ipv4.address }}:8200"
 tls_disable = 1
}

ui = true
