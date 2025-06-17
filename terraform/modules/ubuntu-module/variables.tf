variable "vm_count" {
  description = "Le nombre de machines virtuelles Ubuntu à déployer."
  type        = number
  default     = 1
  validation {
    condition     = var.vm_count >= 1
    error_message = "Le 'vm_count' doit être au moins de 1."
  }
}

variable "name_prefix" {
  description = "Le préfixe pour les noms des VMs (par exemple, 'sle-micro'). Les VMs seront nommées '<prefixe>-1', '<prefixe>-2', etc."
  type        = string
  default     = "ubuntu"
}

variable "namespace" {
  description = "Le namespace Harvester où les VMs seront déployées."
  type        = string
  default     = "prod"
}

variable "cpu" {
  description = "Le nombre de cœurs CPU pour chaque VM."
  type        = number
  default     = 2
  validation {
    condition     = var.cpu >= 1
    error_message = "Le nombre de 'cpu' doit être au moins de 1."
  }
}

variable "memory" {
  description = "La quantité de mémoire pour chaque VM (par exemple, '4Gi', '8Gi')."
  type        = string
  default     = "4Gi"
}

variable "disk_size" {
  description = "La taille du disque racine pour chaque VM (par exemple, '100Gi', '200Gi')."
  type        = string
  default     = "50Gi"
}

variable "image" {
  description = "L'image Harvester à utiliser pour les VMs (par exemple, 'harvester-public/image-8d64r')."
  type        = string
}

variable "network_name" {
  description = "Le nom du réseau Harvester à attacher aux VMs."
  type        = string
  default     = "prod"
}

variable "root_password_hash" {
  description = "Le hachage du mot de passe pour l'utilisateur 'root' dans cloud-init (par exemple, généré avec `openssl passwd -6` ou `mkpasswd -m sha-512`)."
  type        = string
  default     = "$6$rounds=4096$SWCAzqbe0hk6jM0J$5u0E0v0TeB9LXR/eL3c6sQUNYMAXU2W1IvvWlUXEbjeXP4XvWtC7.AaOVlQG6XsTj2S8.MkjUIfJCySGFpvV/1"
}

variable "root_ssh_keys" {
  description = "Une liste de clés publiques SSH pour l'utilisateur 'root'."
  type        = list(string)
  default     = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKwjCRs5i/hhm8ew5l0l9wg1SWtw7sI/cupdglojDAc mmengual@raspberry.home",
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINsDcV8zP/j7PUAjVf37Yie827IUFNruple3Ur5qiwRr thibault@Thibaults-MacBook-Pro.local"
  ]
}

variable "zenops_password_hash" {
  description = "Le hachage du mot de passe pour l'utilisateur 'zenops' dans cloud-init."
  type        = string
  default     = "$6$rounds=4096$SWCAzqbe0hk6jM0J$5u0E0v0TeB9LXR/eL3c6sQUNYMAXU2W1IvvWlUXEbjeXP4XvWtC7.AaOVlQG6XsTj2S8.MkjUIfJCySGFpvV/1"
}

variable "zenops_ssh_keys" {
  description = "Une liste de clés publiques SSH pour l'utilisateur 'zenops'."
  type        = list(string)
  default     = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKwjCRs5i/hhm8ew5l0l9wg1SWtw7sI/cupdglojDAc mmengual@raspberry.home",
    "ssh-ed25519 AAAAC3NzaC1lZDI5NTE5AAAAINsDcV8zP/j7PUAjVf37Yie827IUFNruple3Ur5qiwRr thibault@Thibaults-MacBook-Pro.local"
  ]
}

variable "domain_suffix" {
  description = "Le suffixe de domaine pour le FQDN des VMs (par exemple, 'prod.zenops.fr')."
  type        = string
  default     = "prod.zenops.fr"
}

variable "dns_servers" {
  description = "Une liste d'adresses IP des serveurs DNS pour les VMs."
  type        = list(string)
  default     = ["10.100.11.254"]
}

variable "dns_search_domains" {
  description = "Une liste de domaines de recherche DNS pour les VMs."
  type        = list(string)
  default     = ["prod.zenops.fr"]
}

variable "keyboard_layout" {
  description = "Disposition du clavier pour la VM (par exemple, 'fr')."
  type        = string
  default     = "fr"
}

variable "keyboard_model" {
  description = "Modèle de clavier pour la VM (par exemple, 'pc105')."
  type        = string
  default     = "pc105"
}

variable "keyboard_variant" {
  description = "Variante du clavier pour la VM (par exemple, 'azerty')."
  type        = string
  default     = "azerty"
}