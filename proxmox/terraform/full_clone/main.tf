resource "proxmox_virtual_environment_vm" "LINUXGSM-SERVER" {
  node_name   = var.pve_node
  name        = var.vm_name
  vm_id       = var.vm_id
  description = "# Managed By Terraform"
  tags        = ["CENTOS,VM,SRV"]
  started     = false
  on_boot     = true

  agent {
    enabled = true
  }

  cpu {
  sockets = 1
  cores = var.cpu_cores
  }

  memory {
  dedicated = var.dedicated_memory
  floating = 512
  }

  clone {
    node_name = var.pve_node
    vm_id = var.vm_template
    full = true
  }

  operating_system {
    type = "l26"
  }

  disk {
    datastore_id = var.proxmox_storage
    discard      = "on"
    interface    = "scsi0"
    size         = var.disk_size  # disk size in gigabytes (GB)
  }

  network_device {
    bridge        = "vmbr0"
    vlan_id       = var.vlan_id
    enabled       = "true"
    # mac_address   = ""  # Set this following first creation of VM.
  }

  initialization {
    datastore_id = var.proxmox_storage

  ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.ipv4_gateway
    }

    dns {
      servers = ["1.1.1.1"]
    }


  }

}
