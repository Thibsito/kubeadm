module "ubuntu" {
  source = "./modules/ubuntu-module"
  // Provide values for the module variables
  vm_count             = var.num_ubuntu
  name_prefix          = "ubuntu"
  namespace            = "prod"
  cpu                  = 4
  memory               = "8Gi"
  disk_size            = "50Gi"
  image                = "harvester-public/noble-server-cloudimg-amd64.img" // IMPORTANT: Replace with your actual Harvester image ID/name
  network_name         = "prod"
  root_password_hash   = var.root_password_hash
  root_ssh_keys        = var.global_ssh_keys
  zenops_password_hash = var.zenops_password_hash
  zenops_ssh_keys      = var.global_ssh_keys
  domain_suffix        = "prod.zenops.fr"
  dns_servers          = ["10.100.11.254", "8.8.8.8"]
  dns_search_domains   = ["prod.zenops.fr", "zenops.fr"]
  keyboard_layout      = "fr"
  keyboard_model       = "pc105"
  keyboard_variant     = "azerty"
}