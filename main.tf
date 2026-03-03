terraform {
 cloud {
   organization = "Uday_Kiran"
   workspaces {
     name = "terraform-networking"
   }
 }
 required_providers {
   azurerm = {
     source  = "hashicorp/azurerm"
     version = "~> 3.0"
   }
 }
}
provider "azurerm" {
 features {}  # Required
}
# Resource Group
resource "azurerm_resource_group" "rg" {
 name     = "rg-demo-network"
 location = "East US"
}
# Virtual Network
resource "azurerm_virtual_network" "vnet" {
 name                = "vnet-demo"
 location            = azurerm_resource_group.rg.location
 resource_group_name = azurerm_resource_group.rg.name
 address_space       = ["10.0.0.0/16"]
}
# Subnet
resource "azurerm_subnet" "subnet" {
 name                 = "subnet-demo"
 resource_group_name  = azurerm_resource_group.rg.name
 virtual_network_name = azurerm_virtual_network.vnet.name
 address_prefixes     = ["10.0.1.0/24"]
}
# Outputs (for compute workspace)
output "rg_name" { value = azurerm_resource_group.rg.name }
output "subnet_id" { value = azurerm_subnet.subnet.id }
output "location" { value = azurerm_resource_group.rg.location }
