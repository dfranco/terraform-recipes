variable "prefix" {
  description = "Prefix of the resource name"
  type        = string
  default     = "az-tf-k3s"
}

variable "location" {
  description = "Default location of the resource"
  type        = string
  default     = "westeurope"
}