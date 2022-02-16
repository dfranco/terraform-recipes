variable "proxmox_username" {
  type        = string
  description = "ProvMox VE privileged user"
}

variable "proxmox_password" {
  type        = string
  description = "ProvMox VE privileged user password"
  sensitive   = true
}

variable "proxmox_endpoint" {
  type        = string
  description = "ProxMox VE endpoint url"
}

variable "proxmox_add_username" {
  type        = string
  description = "New user"
  default     = "newuser@pve"
}

variable "proxmox_add_password" {
  type        = string
  description = "New user password"
  default     = "strong-password"
  sensitive   = true
}

variable "proxmox_add_user_groups" {
  type        = list(any)
  description = "New user group(s)"
  default     = [ "usergroup" ]
}

variable "proxmox_group_role" {
  type        = string
  default     = "PVEVMUser"
  description = "New user group role"
}