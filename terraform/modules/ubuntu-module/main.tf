# modules/vm/main.tf
resource "harvester_virtualmachine" "ubuntu" {
  count     = var.vm_count
  name      = "${var.name_prefix}-${count.index + 1}"
  namespace = var.namespace
  cpu       = var.cpu
  memory    = var.memory

  disk {
    name        = "rootdisk"
    type        = "disk"
    size        = var.disk_size
    bus         = "virtio"
    boot_order  = 1
    image       = var.image
    auto_delete = true
  }

  network_interface {
    name         = "default"
    model        = "virtio"
    network_name = var.network_name
  }
  cloudinit {
    user_data = <<-EOF
      #cloud-config
      debug: true
      package_update: true
      packages:
        - qemu-guest-agent
      runcmd:
        - [ systemctl, enable, --now, qemu-guest-agent.service ]
      ssh_pwauth: true
      allow_public_ssh_keys: true
      ### This section define user with static password
      users:
      - default
      - name: root
        passwd: ${var.root_password_hash}
        lock_passwd: false
        shell: /bin/bash
        ssh_authorized_keys:
          %{for key in var.root_ssh_keys ~}
          - ${key}
          %{endfor ~}

      - name: zenops
        gecos: Tech ZenOps
        groups: users, admin
        lock_passwd: false
        shell: /bin/bash
        sudo: ALL=(ALL) NOPASSWD:ALL
        passwd: ${var.zenops_password_hash}
        ssh_authorized_keys:
          %{for key in var.zenops_ssh_keys ~}
          - ${key}
          %{endfor ~}

      ### Change the hostname here
      hostname: ${var.name_prefix}-${count.index + 1}
      fqdn: ${var.name_prefix}-${count.index + 1}.${var.domain_suffix}
      keyboard:
        layout: ${var.keyboard_layout}
        model: ${var.keyboard_model}
        variant: ${var.keyboard_variant}
    EOF
    network_data = <<-EOF
      #cloud-config network
      network:
      version: 2
      ethernets:
      ### Change network interface name if required, eth0 for SUSE, enp1s0 for Ubuntu
        enp1s0:
          dhcp4: yes
          nameservers:
            addresses: [${join(", ", var.dns_servers)}]
            search: [${join(", ", var.dns_search_domains)}]
    EOF
  }
}