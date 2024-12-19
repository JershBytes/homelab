### Static Variables ###
variable "virtual_environment_endpoint" {
  type = string
}

variable "proxmox_ve_api_token" {
    type = string
    sensitive = true
}

variable "proxmox_storage" {
  type = string
}

variable "pve_node" {
  type = string
}

variable "user_account" {
  type = string
}

variable "user_account_password" {
  type = string
  sensitive = true
}

### Dynamic Variables ###

variable "vm_name" {
  type = string
}

variable "vm_template" {
  type = string
}

variable "vm_id" {
  type = string
}

variable "cpu_cores" {
  type = string
}

variable "dedicated_memory" {
  type = string
}

variable "disk_size" {
  type = string
}

variable "vlan_id" {
  type = string
}

variable "ipv4_address" {
  type = string
}

variable "ipv4_gateway" {
  type = string
}

