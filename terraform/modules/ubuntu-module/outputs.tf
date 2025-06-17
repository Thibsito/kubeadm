output "vm_names" {
  description = "Une liste des noms des machines virtuelles déployées."
  value       = harvester_virtualmachine.ubuntu[*].name
}

output "vm_ids" {
  description = "Une liste des IDs des machines virtuelles déployées."
  value       = harvester_virtualmachine.ubuntu[*].id
}

