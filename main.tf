module "urt_server" {
    source = "./modules/urt"

    node_label = "urbanterror-0"
    region = var.region
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
    maintenance_public_ssh_keys = var.maintenance_public_keys
    domain_id = length(linode_domain.domain_name) > 0 ? linode_domain.domain_name[0].id : null
    subdomain = var.urt_subdomain
    setup_domain = var.primary_domain != null
    maintenance_user = var.urt_maintenance_user
    service_user = var.urt_service_user
}

module "mc_server" {
    source = "./modules/mc"

    region = var.region
    state_volume_id = var.mc_game_state_volume_id
    node_label = "minecraft-0"
    root_pass = var.root_pass
    linode_token = var.linode_token
    maintenance_public_ssh_keys = var.maintenance_public_keys
    server_rcon_password = var.mc_rcon_pass
    domain_id = length(linode_domain.domain_name) > 0 ? linode_domain.domain_name[0].id : null
    subdomain = var.mc_subdomain
    setup_domain = var.primary_domain != null
    maintenance_user = var.mc_maintenance_user
    service_user = var.mc_service_user
}

resource "linode_domain" "domain_name" {
  count = var.primary_domain == null ? 0 : 1
  domain = var.primary_domain
  type = "master"
  soa_email = var.soa_email
}
