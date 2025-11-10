output "node_id" {
    value = linode_instance.ut-sarvar.id
}

output "node_ipv4" {
    value = slice([
    for element in linode_instance.ut-sarvar.ipv4 : element
  ], 0, 1).0
}

output "node_ipv6" {
    value = split("/",linode_instance.ut-sarvar.ipv6).0
}