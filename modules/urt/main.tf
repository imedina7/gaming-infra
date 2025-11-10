locals {
  node_ipv6 = split("/", linode_instance.ut-sarvar.ipv6).0
  node_ipv4 = slice([
    for element in linode_instance.ut-sarvar.ipv4 : element
  ], 0, 1).0
}

resource "linode_firewall" "urt_firewall" {
  label = "urt_firewall"

  inbound {
    label    = "allow-urt"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "27960"
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

  linodes = [linode_instance.ut-sarvar.id]
}

# Create a Linode
resource "linode_instance" "ut-sarvar" {
  region          = var.region
  image           = var.node_image
  label           = var.node_label
  type            = var.node_type
  root_pass       = var.root_pass
  authorized_keys = var.authorized_keys

  tags       = ["urt","gaming"]
  swap_size  = 1024
  private_ip = true

  metadata {
    user_data = base64encode(templatefile("${path.module}/cloud-config.yml", {
      service_user = var.service_user
      maintenance_user = var.maintenance_user
      host_name = var.server_host_name
      join_message = var.server_join_message
      motd = var.server_motd
      time_limit = var.server_time_limit
      name_red_team = var.server_name_red_team
      name_blue_team = var.server_name_blue_team
      rcon_password = var.server_rcon_password
      private_slot_password = var.server_private_slot_password
      password = var.server_password
      game_type = var.server_game_type
      max_clients = var.server_max_clients
      mapcycle = base64encode(var.server_mapcycle)
      armbands = var.server_armbands
      skins = var.server_skins
      funstuff = var.server_funstuff
      gear = var.server_gear
      allowvote = var.server_allowvote
      failedvotetime = var.server_failedvotetime
      maxGameClients = var.server_maxGameClients
      allowchat = var.server_allowchat
      deadchat = var.server_deadchat
      inactivity = var.server_inactivity
      maintenance_public_ssh_keys = var.maintenance_public_ssh_keys
    }))
  }
}

resource "linode_domain_record" "urt_domain_record_A" {
  count = var.setup_domain ? 1 : 0
  domain_id = var.domain_id
  target = local.node_ipv4
  record_type = "A"
  name = var.subdomain
  ttl_sec = 900
}

resource "linode_domain_record" "urt_domain_record_AAAA" {
  count = var.setup_domain ? 1 : 0
  domain_id = var.domain_id
  target = local.node_ipv6
  record_type = "AAAA"
  name = var.subdomain
  ttl_sec = 900
}
