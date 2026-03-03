terraform {
 cloud {
   organization = "YOUR_HCP_ORG"
   workspaces { name = "networking-workspace" }
 }
 required_providers {
   azurerm = { source = "hashicorp/azurerm", version = "~> 3.0" }
 }
}
provider "azurerm" { features {} }
