variable "root_pass" {
    description = "Root password"
    default = ""
}

variable "node_type" {
    description = "Linode Instance type"
    default = "g6-standard-1"
}

variable "service_user" {
  default = "mc"
}

variable "maintenance_user" {
  default = "serv"
}

variable "region" {
    default = "br-gru"
}

variable "linode_token" {
    description = "Linode personal access token"
}

variable "node_label" {
    description = "The name for the server"
    default = "minecraft-server"
}

variable "state_volume_id" {
    default = null
}

variable "maintenance_public_ssh_keys" {
    default = []
}

variable "server_rcon_password" {}
variable "server_motd" {
    default = "A Minecraft server deployed using terraform"
}
variable "server_gamemode" {
    default = "survival"
}
variable "server_generate_structures" {
    default = true
}
variable "server_world_seed" {
    default = ""
}
variable "server_max_players" {
    default = 20
}
variable "server_rcon_port" {
    default = 25575
}
variable "server_port" {
    default = 25565
}
variable "setup_domain" {
    default = false
}
variable "domain_id" {}
variable "subdomain" {
    default = "mc"
}