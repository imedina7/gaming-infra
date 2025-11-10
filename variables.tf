variable "urt_host_name" {
  default = "Test server"
}
variable "urt_join_message" {
  default = "Hello!"
}
variable "urt_motd" {
  default = "Peww peww"
}
variable "urt_time_limit" {
  default = 10
}

variable "urt_red_team_name" {
  default = "Red team"
}
variable "urt_blue_team_name" {
  default = "Blue team"
}

variable "primary_domain" {
  description = "The primary domain to use"
  nullable = true
  default = null
}

variable "soa_email" {
  default = "test@example.com"
}

variable "root_pass" {
  default = ""
}

variable "linode_token" {
  description = "Linode personal access token"
}

variable "urt_subdomain" {
  default = "urt"
}

variable "mc_subdomain" {
  default = "mc"
}

variable "urt_rcon_pass" {}
variable "urt_private_slot_pass" {}
variable "urt_server_pass" {}
variable "urt_game_type" {}
variable "urt_max_clients" {}
variable "mc_game_state_volume_id" {}

variable "maintenance_public_keys" {
  default = []
}
variable "mc_rcon_pass" {}
