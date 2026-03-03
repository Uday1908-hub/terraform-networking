terraform {
 cloud {
   organization = "Uday_Kiran"
   workspaces { name = "networking-workspace" }
 }
 required_providers {
   azurerm = { source = "hashicorp/azurerm", version = "~> 3.0" }
 }
}
provider "azurerm" { features {} }
