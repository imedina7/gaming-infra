variable "node_label" {
  description = "The name for the server"
  default     = "ut-sarvar"
}

variable "node_type" {
  description = "The size (plan) for your Urban Terror Server"
  default     = "g6-standard-1"
}

variable "node_image" {
  description = "The image to deploy to instance"
  default     = "linode/arch"
}

variable "service_user" {
  default = "ut"
}

variable "maintenance_user" {
  default = "serv"
}

variable "region" {
  description = "The default Linode region to deploy the infrastructure"
  default     = "br-gru"
}

variable "authorized_keys" {
  description = "The Public id_rsa.pub key used for secure SSH connections"
  default     = []
}

variable "root_pass" {
  description = "The default root password for the Linode server"
  default     = "default-root-password"
}

variable "linode_token" {
  description = "Linode personal access token"

}

variable "server_host_name" {
  description = "Server name"
  default     = "My Urbanterror Server"
}
variable "server_join_message" {
  description = "Server Join message"
  default     = "Hello, welcome to my server"
}
variable "server_motd" {
  description = "Server message of the day"
  default     = "It's a grreeeat day for war"
}
variable "server_time_limit" {
  description = "Game round time limit"
  default     = 15
}
variable "server_name_red_team" {
  description = "Red team custom name"
  default     = "Red team"
}
variable "server_name_blue_team" {
  description = "Blue team custom name"
  default     = "Blue team"
}
variable "server_rcon_password" {
  description = "Game Remote control password"
  default     = ""
}
variable "server_private_slot_password" {
  description = "Reserved Private Slot Password"
  default     = ""
}
variable "server_password" {
  description = "No password = Public"
  default     = ""
}
variable "server_game_type" {
  description = "Game mode"
  default     = 11
}
variable "server_max_clients" {
  description = "Max concurrent clients"
  default     = 12
}

variable "server_armbands" {
  description = "Determines the behaviour of the armband color. 0 = player's choice, set with cg_rgb, 1 = based on team color, 2 = assigned randomly by server"
  default     = "0"
}
variable "server_skins" {
  description = "If set to 1 enable the use of the client side skin selection system. Using 0 means default back to Red and Blue teams"
  default     = "1"
}
variable "server_funstuff" {
  description = "If set to 1 enable the use of funstuff on the server "
  default     = "1"
}
variable "server_gear" {
  description = "List of weapons and items to disallow, using their letters. Check http://www.urbanterror.info/support/180-server-cvars/#1.2 to use the automatic g_gear generator."
  default     = ""
}
variable "server_allowvote" {
  description = "Bitmask that decides which votes are allowed and which not. Check http://www.urbanterror.info/support/180-server-cvars/#1.3 to find the correct number"
  default     = "603981055"
}
variable "server_failedvotetime" {
  description = "Amount of seconds before someone can call another vote after another has failed"
  default     = "300"
}
variable "server_maxGameClients" {
  description = "Max clients that can actually join the game. Other clients are forced to spectate. (0 = All)"
  default     = "0"
}
variable "server_allowchat" {
  description = "Determines the behaviour of the chat. 0 = no chatting at all, 1 = teamchats only, 2 = all chats, 3 = captains only in matchmode (Default = 2)"
  default     = "2"
}
variable "server_deadchat" {
  description = "Determines if alive players can see dead players messages. 0 = living players can not see dead players chat, 1 = living players see only team-messages from dead teammembers, 2 = living players also see normal chats from dead players"
  default     = "2"
}
variable "server_inactivity" {
  description = "Time in seconds before a non-moving player will be kicked off the server"
  default     = "0"
}

variable "server_mapcycle" {
  description = "Contents of mapcycle.txt"
  default     = <<EOF
ut4_turnpike
{
  g_gametype 9
}
ut4_algiers
ut4_kingdom
ut4_uptown
ut4_sanc
ut4_abbey
ut4_thingley
ut4_subway
ut4_paris
ut4_riyadh
EOF
}

variable "maintenance_public_ssh_keys" {
  default = []
}

variable "setup_domain" {
  default = false
}
variable "domain_id" {
  nullable = true
}
variable "subdomain" {
    default = "urt"
}