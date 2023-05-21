####  Create User Assigned Managed Identity
resource "azurerm_user_assigned_identity" "uai" {
  resource_group_name = "rg1"
  name ="uai"
  location= "East US"
  tags = {
    contact_email = "aswini.chirumamilla@gds.ey.com"
    contact_name  = "aswini"
    project_name  = "CIL"
    region        = "East US"

  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.28.0"
    }
  }

}

provider "azurerm" {
    subscription_id = ""
  features {}
}
         

