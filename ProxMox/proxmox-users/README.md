# ProxMox users, groupes and roles

This page describe how to provision user(s), group(s) and role(s) for [ProxMox VE](https://www.proxmox.com/en/proxmox-ve)

In the instructions below, I'm using Terraform ProxMox provider from the this GitHub repository

<https://github.com/danitso/terraform-provider-proxmox>

## Goals

- Provision a group
- Provision a user
- Make sure the user is part of a specific group
- Assign ProxMox role to a specific group

## Setup environment variables

Before running `terraform plan` and `terraform apply`, make sure you've exported env. variables described below

### ProxMox username

The example below use the default root account (PAM)

```shell
export TF_VAR_proxmox_username="root@pam"
```

### ProxMox user password

```shell
export TF_VAR_proxmox_password="strong_password"
```

### ProxMox endpoint

Endoint **must** include *scheme* and *port number* (example below)

```shell
export TF_VAR_proxmox_endpoint="https://172.17.20.55:8006"
```

> Important: exposing sensitive information such as password etc. are really bad practices.
> My recommendation is to use Terraform in conjunction with [HashiCorp Vault](https://www.hashicorp.com/products/vault) for example

## Variables

In [variables.tf](variables.tf), override values for 

New user name

```hcl
variable "proxmox_add_username" {
  type        = string
  description = "New user"
  default     = "monitoring@pve"
}
```

New user password

```hcl
variable "proxmox_add_password" {
  type        = string
  description = "New user password"
  default     = "strong-password"
  sensitive   = true
}
```

Group name

```hcl
variable "proxmox_add_user_groups" {
  type        = list(any)
  description = "New user group(s)"
  default     = [ "monitoring" ]
}
```

Group role

```hcl
variable "proxmox_group_role" {
  type        = string
  default     = "PVEVMUser"
  description = "New user group role"
}
```
