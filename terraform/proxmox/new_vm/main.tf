resource "proxmox_virtual_environment_vm" "LINUXGSM-SERVER" {
  node_name   = var.pve_node
  name        = var.vm_name
  vm_id       = var.vm_id
  description = "# Managed By Terraform"
  tags        = ["CENTOS,VM,SRV"]
  started     = false
  on_boot     = true

  initialization {
    user_account {
      # do not use this in production, configure your own ssh key instead!
      username = var.user_account
      password = var.user_account_password
    }
  }

  resource "proxmox_virtual_environment_download_file" "rocky_cloud_image" {
  content_type = "iso"
  datastore_id = "images"
  node_name    = var.pve_node
  url          = "https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2"
  file_name    = "rocky9.img"
}

  agent {
    enabled = true
  }

  cpu {
  sockets = 2
  cores = var.cpu_cores
  }

  memory {
  dedicated = var.dedicated_memory
  floating = 512
  }

  operating_system {
    type = "l26"
  }

  disk {
    datastore_id = var.proxmox_storage
    file_id      = proxmox_virtual_environment_download_file.rocky_cloud_image.id
    discard      = "on"
    interface    = "scsi0"
    size         = var.disk_size  # disk size in gigabytes (GB)
    iotheread    = true
  }

  network_device {
    bridge        = "vmbr1"
    vlan_id       = var.vlan_id
    enabled       = "true"
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
}