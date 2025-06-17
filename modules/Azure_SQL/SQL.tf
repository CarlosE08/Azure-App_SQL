resource "azurerm_mssql_server" "sql_server" {
  name                         = "${lower(var.generate_name)}-web-sqls-01"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_version
  administrator_login          = var.sql_user
  administrator_login_password = var.sql_password # Todo esto guardado en tfvars

  minimum_tls_version           = var.sql_tls_version
  public_network_access_enabled = true

  tags = var.common_tags
}

resource "azurerm_mssql_database" "clon_db" {
  name                        = var.database_name
  server_id                   = azurerm_mssql_server.sql_server.id
  create_mode                 = "Copy"
  creation_source_database_id = var.creation_database_id

  tags = var.common_tags
}

resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}