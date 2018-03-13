provider "azurerm" {
  subscription_id = "${var.provider["subscription_id"]}"
}

resource "azurerm_resource_group" "reg_rg" {
  name     = "${var.resource_group["name"]}"
  location = "${var.location}"
}

resource "azurerm_storage_account" "reg_sa" {
  name                     = "${var.storage_account["name"]}"
  resource_group_name      = "${azurerm_resource_group.reg_rg.name}"
  location                 = "${azurerm_resource_group.reg_rg.location}"
  account_tier             = "${var.storage_account["account_tier"]}"
  account_replication_type = "${var.storage_account["account_replication_type"]}"
}

resource "azurerm_container_registry" "reg_cr" {
  name                = "${var.container_registry["name"]}"
  resource_group_name = "${azurerm_resource_group.reg_rg.name}"
  location            = "${azurerm_resource_group.reg_rg.location}"
  admin_enabled       = "${var.container_registry["admin_enabled"]}"
  sku                 = "${var.container_registry["sku"]}"
  storage_account_id  = "${azurerm_storage_account.reg_sa.id}"
}
