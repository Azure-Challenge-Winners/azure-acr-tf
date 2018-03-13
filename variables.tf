variable "provider" {
  type = "map"
  default = {
    subscription_id = "49a452d5-d18e-4c2a-b873-75b794bf0ac4"
  }
}

variable "location" {
  default = "East US"
}

variable "resource_group" {
  type = "map"
  default = {
    name = "team5rg"
  }
}

variable "storage_account" {
  type = "map"
  default = {
    name = "team5sa"
    account_tier = "Standard"
    account_replication_type = "GRS"
  }
}

variable "container_registry" {
  type = "map"
  default = {
    name = "team5ca"
    admin_enabled = "true"
    sku = "Classic"
  }
}
