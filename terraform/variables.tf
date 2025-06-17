variable "vm_count" {
  description = "The number of Ubuntu virtual machines to deploy."
  type        = number
  default     = 3
  validation {
    condition     = var.vm_count >= 1
    error_message = "The 'vm_count' must be at least 1."
  }
}

variable "name_prefix" {
  description = "The prefix for the VM names (e.g., 'sle-micro'). The VMs will be named '<prefix>-1', '<prefix>-2', etc."
  type        = string
  default     = "ubuntu"
}

variable "namespace" {
  description = "The Harvester namespace where the VMs will be deployed."
  type        = string
  default     = "prod"
}

variable "cpu" {
  description = "The number of CPU cores for each VM."
  type        = number
  default     = 4
  validation {
    condition     = var.cpu >= 1
    error_message = "The 'cpu' count must be at least 1."
  }
}

variable "memory" {
  description = "The amount of memory for each VM (e.g., '4Gi', '8Gi')."
  type        = string
  default     = "8Gi"
}

variable "disk_size" {
  description = "The size of the root disk for each VM (e.g., '100Gi', '200Gi')."
  type        = string
  default     = "100Gi"
}

variable "image" {
  description = "The Harvester image to use for the VMs (e.g., 'harvester-public/image-8d64r')."
  type        = string
  default     = "harvester-public/noble-server-cloudimg-amd64.img"
}

variable "network_name" {
  description = "The name of the Harvester network to attach to the VMs."
  type        = string
  default     = "prod"
}

variable "root_password_hash" {
  description = "The hashed password for the 'root' user in cloud-init (e.g., generated with `openssl passwd -6` or `mkpasswd -m sha-512`)."
  type        = string
  // Use a placeholder or strong recommendation to provide a real hash
  default     = "$6$Z/BY6nESk86rvbeD$yCOPX520JJd42PDtVtnro.P4mlALx6u00eflq/l3yAUFXPei4c07k8Tw/Rg0AwzD/qybCilPX2.IMrh.SJssU/" // Example hash from your provided code
}

variable "root_ssh_keys" {
  description = "A list of SSH public keys for the 'root' user."
  type        = list(string)
  default     = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKwjCRs5i/hhm8ew5l0l9wg1SWtw7sI/cupdglojDAc mmengual@raspberry.home",
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINsDcV8zP/j7PUAjVf37Yie827IUFNruple3Ur5qiwRr thibault@Thibaults-MacBook-Pro.local"
  ]
}

variable "zenops_password_hash" {
  description = "The hashed password for the 'zenops' user in cloud-init."
  type        = string
  // Use a placeholder or strong recommendation to provide a real hash
  default     = "$6$hX3oYYBabE0QXOuF$NfaXIvj8I91YSGZHtkvuqsGwKQ5XviOqtgAiGwnEkzzSYwdFtwNnzHqZBuhVO/vG8xO6ccFF6EpA3KpDsF5hU." // Example hash from your provided code
}

variable "zenops_ssh_keys" {
  description = "A list of SSH public keys for the 'zenops' user."
  type        = list(string)
  default     = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKwjCRs5i/hhm8ew5l0l9wg1SWtw7sI/cupdglojDAc mmengual@raspberry.home",
    "ssh-ed25519 AAAAC3NzaC1lZDI5NTE5AAAAINsDcV8zP/j7PUAjVf37Yie827IUFNruple3Ur5qiwRr thibault@Thibaults-MacBook-Pro.local"
  ]
}

variable "domain_suffix" {
  description = "The domain suffix for the FQDN of the VMs (e.g., 'prod.zenops.fr')."
  type        = string
  default     = "prod.zenops.fr"
}

variable "dns_servers" {
  description = "A list of DNS server IP addresses for the VMs."
  type        = list(string)
  default     = ["10.100.11.254"]
}

variable "dns_search_domains" {
  description = "A list of DNS search domains for the VMs."
  type        = list(string)
  default     = ["prod.zenops.fr"]
}

variable "keyboard_layout" {
  description = "Keyboard layout for the VM (e.g., 'fr')."
  type        = string
  default     = "fr"
}

variable "keyboard_model" {
  description = "Keyboard model for the VM (e.g., 'pc105')."
  type        = string
  default     = "pc105"
}

variable "keyboard_variant" {
  description = "Keyboard variant for the VM (e.g., 'azerty')."
  type        = string
  default     = "azerty"
}

variable "harvester_kubeconfig_path" {
    description = "Harvester cluster Kubeconfig file name with full path"
    type        = string
    default = "/Users/thibault/.kube/zenops-harvester.yaml"
}

variable "global_ssh_keys" {
  description = "Global SSH public keys to be used across all users"
  type        = list(string)
  default     = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKwjCRs5i/hhm8ew5l0l9wg1SWtw7sI/cupdglojDAc mmengual@raspberry.home",
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINsDcV8zP/j7PUAjVf37Yie827IUFNruple3Ur5qiwRr thibault@Thibaults-MacBook-Pro.local"
  ]
}

variable "num_ubuntu" {
  description = "Number of Ubuntu VMs to create"
  type        = number
  default     = 3
}

