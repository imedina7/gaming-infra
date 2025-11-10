output "node_id" {
    value = linode_instance.ut-sarvar.id
}

output "node_ipv4" {
    value = local.node_ipv4
}

output "node_ipv6" {
    value = local.node_ipv6
}