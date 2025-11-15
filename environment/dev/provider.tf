terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }

backend "azurerm" {
    resource_group_name = "yuvi"
    storage_account_name = "yuvistg"                                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "yuvicntr"                                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "backuptf1.tfstate"                   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}



provider "azurerm" {
  features {}
  subscription_id = "dbc44e07-0c52-4013-97e5-e416090c2bea"
}