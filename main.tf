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
 features {}  
}
resource "azurerm_resource_group" "rg" {
 name     = "rg-demo-network"
 location = "East US"
}
# Output variable
output "rg_name" {
 value = azurerm_resource_group.rg.name
}

