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
  image           = var.utserver_image
  label           = var.utserver_label
  type            = var.utserver_type
  root_pass       = var.root_pass

  tags       = ["urt"]
  swap_size  = 1024
  private_ip = true
  metadata {
    user_data = filebase64("./cloud-config.yml")
  }
}

resource "linode_domain" "israelmedina_dev_domain" {
  domain = var.primary_domain
  type = "master"
  soa_email = "contact@israelmedina.com"
}

resource "linode_domain_record" "domain-record" {
  domain_id = linode_domain.israelmedina_dev_domain.id
  target = linode_instance.ut-sarvar.ip_address
  record_type = "A"
  name = "urt"
}