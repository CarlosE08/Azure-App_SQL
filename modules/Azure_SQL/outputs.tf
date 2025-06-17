output "sql_server_name" {
  value = azurerm_mssql_server.sql_server.name
}
output "sql_server_id" {
  value = azurerm_mssql_server.sql_server.id
}
output "sql_database_name" {
  value = azurerm_mssql_database.clon_db.name
}
output "sql_database_id" {
  value = azurerm_mssql_database.clon_db.id
}