terraform {
  required_version = ">= 0.13"

  required_providers {
    proxmox = {
      source  = "danitso/proxmox"
      version = "~> 0.4.4"
    }
  }
}

provider "proxmox" {
  virtual_environment {
    username = var.proxmox_username
    password = var.proxmox_password
    endpoint = var.proxmox_endpoint
    insecure = true
  }
}

# Monitoring group
resource "proxmox_virtual_environment_group" "monitoring_group" {
  comment  = "Provided by Terraform"
  group_id = "monitoring"

  acl {
    path      = "/"
    propagate = true
    role_id   = var.proxmox_group_role
  }
}

resource "proxmox_virtual_environment_user" "monitoring" {
  user_id  = var.proxmox_add_username
  comment  = "Provided by Terraform"
  groups   = ["monitoring"]
  password = var.proxmox_add_password
}