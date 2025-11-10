locals {
  node_ipv6 = split("/", linode_instance.minecraft_server.ipv6).0
  node_ipv4 = slice([
    for element in linode_instance.minecraft_server.ipv4 : element
  ], 0, 1).0
}

resource "linode_firewall" "minecraft_firewall" {
  label = "minecraft_firewall"

  inbound {
    label    = "allow-minecraft-tcp"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "${var.server_rcon_port}"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-minecraft-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "${var.server_port}"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound_policy = "DROP"

  outbound_policy = "ACCEPT"

  linodes = [linode_instance.minecraft_server.id]

}
resource "linode_instance" "minecraft_server" {
  label           = var.node_label
  image           = "linode/arch"
  region          = var.region
  type            = var.node_type
  root_pass       = var.root_pass

  metadata {
    user_data = base64encode(templatefile("${path.module}/cloud-config.yml", {
      maintenance_user = var.maintenance_user
      service_user = var.service_user
      maintenance_public_ssh_keys = var.maintenance_public_ssh_keys
      rcon_password = var.server_rcon_password
      motd = var.server_motd
      gamemode = var.server_gamemode
      generate_structures = var.server_generate_structures
      seed = var.server_world_seed
      max_players = var.server_max_players
      rcon_port = var.server_rcon_port
      server_port = var.server_port
    }))
  }

  tags       = ["minecraft"]
  swap_size  = 1024
  private_ip = true
}

resource "linode_instance_config" "minecraft_server_config" {
  count = var.state_volume_id != 0 ? 1 : 0
  linode_id = linode_instance.minecraft_server.id
  label = "minecraft-server-state-config"

  device {
    device_name = "sdc"
    volume_id = var.state_volume_id
  }
}

resource "linode_domain_record" "mc_domain_record_A" {
  count = var.setup_domain ? 1 : 0
  domain_id = var.domain_id
  target = local.node_ipv4
  record_type = "A"
  name = var.subdomain
  ttl_sec = 900
}

resource "linode_domain_record" "mc_domain_record_AAAA" {
  count = var.setup_domain ? 1 : 0
  domain_id = var.domain_id
  target = local.node_ipv6
  record_type = "AAAA"
  name = var.subdomain
  ttl_sec = 900
}
