variable "utserver_label" {
    description = "The name for the Web Server"
    default = "ut-sarvar"
}

variable "utserver_type" {
    description = "The size (plan) for your Urban Terror Server"
    default = "g6-standard-1"
}

variable "utserver_image" {
    description = "The image to deploy to instance"
    default = "linode/arch"
}

variable "region" {
    description = "The default Linode region to deploy the infrastructure"
    default = "br-gru"
}

variable "authorized_keys" {
    description = "The Public id_rsa.pub key used for secure SSH connections"
    default = ["default-ssh-public-key"]
}

variable "root_pass" {
    description = "The default root password for the Linode server"
    default = "default-root-password"
}

variable "LINODE_PAT" {
    description = "Linode personal access token"
    default = ""
}

variable "primary_domain" {
    description = "The primary domain to use"
    default = "israelmedina.dev"
}
