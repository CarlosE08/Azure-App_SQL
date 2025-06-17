terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.80.0" # o la última estable
    }
  }
}


provider "azurerm" {
  features {}
  skip_provider_registration = true # Evita la advertencia de registro del proveedor
}

module "App_Service" {
  source = "./modules/Azure_AppService" # Ruta al módulo de Terraform que contiene la definición del App Service

  location                = var.location                # Ubicación del recurso App Service
  connection_string_value = var.connection_string_value # Valor de la cadena de conexión a la base de datos SQL

  resource_group_name = var.resource_group_name # Nombre del grupo de recursos donde se desplegará el App Service

  common_tags = local.common_tags # Etiquetas comunes para los recursos

  generate_name = local.generate_name # Ubicación general para los recursos

  sku_name = var.sku_name # Nombre del SKU para el App Service Plan
  os_type  = var.os_type  # Tipo de sistema operativo para el App Service

  sql_tls_version    = var.sql_tls_version    # Versión TLS mínima para el App Service
  appservice_command = var.appservice_command # Comando para ejecutar en el App Service
}

module "Azure_SQL" {

  source = "./modules/Azure_SQL" # Ruta al módulo de Terraform que contiene la definición del SQL

  location            = var.location            # Ubicación del recurso SQL
  resource_group_name = var.resource_group_name # Nombre del grupo de recursos donde se desplegará el SQL

  common_tags = local.common_tags # Etiquetas comunes para los recursos

  generate_name = local.generate_name # Ubicación general para los recursos

  sql_password    = var.sql_password    # Contraseña del usuario administrador de SQL
  sql_user        = var.sql_user        # Usuario administrador de SQL
  sql_version     = var.sql_version     # Versión de SQL Server
  sql_tls_version = var.sql_tls_version # Versión TLS mínima para SQL Server

  database_name        = var.database_name        # Nombre de la base de datos a crear
  creation_database_id = var.creation_database_id # ID de la base de datos de origen para
}