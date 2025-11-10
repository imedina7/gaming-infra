module "urt_server" {
    source = "./modules/urt"

    node_label = "urbanterror-0"
    root_pass = var.root_pass
    linode_token = var.linode_token
    
    server_host_name = var.urt_host_name
    server_join_message = var.urt_join_message
    server_motd = var.urt_motd
    server_time_limit = var.urt_time_limit
    server_name_red_team = var.urt_red_team_name
    server_name_blue_team = var.urt_blue_team_name
    server_rcon_password = var.urt_rcon_pass
    server_private_slot_password = var.urt_private_slot_pass
    server_password = var.urt_server_pass
    server_game_type = var.urt_game_type
    server_max_clients = var.urt_max_clients
    maintenance_public_ssh_key = var.maintenance_public_key
}

module "mc_server" {
    source = "./modules/mc"

    state_volume_id = var.mc_game_state_volume_id
    node_label = "minecraft-0"
    root_pass = var.root_pass
    linode_token = var.linode_token
    maintenance_public_ssh_key = var.maintenance_public_key
    server_rcon_password = var.mc_rcon_pass
}

resource "linode_domain" "israelmedina_dev_domain" {
  domain = var.primary_domain
  type = "master"
  soa_email = var.soa_email
}

resource "linode_domain_record" "urt_domain_record_A" {
  domain_id = linode_domain.israelmedina_dev_domain.id
  target = module.urt_server.node_ipv4
  record_type = "A"
  name = "urt"
  ttl_sec = 900
}

resource "linode_domain_record" "urt_domain_record_AAAA" {
  domain_id = linode_domain.israelmedina_dev_domain.id
  target = module.urt_server.node_ipv6
  record_type = "AAAA"
  name = "urt"
  ttl_sec = 900
}

resource "linode_domain_record" "mc_domain_record_A" {
  domain_id = linode_domain.israelmedina_dev_domain.id
  target = module.mc_server.node_ipv4
  record_type = "A"
  name = "mc"
  ttl_sec = 900
}

resource "linode_domain_record" "mc_domain_record_AAAA" {
  domain_id = linode_domain.israelmedina_dev_domain.id
  target = module.mc_server.node_ipv6
  record_type = "AAAA"
  name = "mc"
  ttl_sec = 900
}
