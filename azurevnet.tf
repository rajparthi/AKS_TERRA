resource "azurerm_resource_group" "DNS_ZONE" {
  name     = "AKS_RG"
  location = "central india"
}

resource "azurerm_virtual_network" "DNS_ZONE_vnet" {
  name                = "DNS_ZONE-vnet"
  address_space       = ["10.10.0.0/16"]
  location            = "${azurerm_resource_group.DNS_ZONE.location}"
  resource_group_name = "${azurerm_resource_group.DNS_ZONE.name}"
}

resource "azurerm_subnet" "aks_sub1" {
  name                 = "aks-subnet"
  resource_group_name  = "${azurerm_resource_group.DNS_ZONE.name}"
  virtual_network_name = "${azurerm_virtual_network.DNS_ZONE_vnet.name}"
  address_prefix       = "10.10.1.0/24"
}

resource "azurerm_subnet" "apim_sub2" {
  name                 = "apim-subnet"
  resource_group_name  = "${azurerm_resource_group.DNS_ZONE.name}"
  virtual_network_name = "${azurerm_virtual_network.DNS_ZONE_vnet.name}"
  address_prefix       = "10.10.2.0/24"
}