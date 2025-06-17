output "name" {
  value = module.App_Service.App_Service_Name
}

output "default_hostname" {
  value = module.App_Service.App_Service_Default_Hostname
}

output "App_Service_virtual_network_ip_configuration" {
  value = module.App_Service.App_Service_virtual_network_ip_configuration
}

output "webapp_outbound_ips" {
  value = module.App_Service.webapp_outbound_ips
}


######################## Outputs de SQL Server ########################
output "sql_server_name" {
  value = module.Azure_SQL.sql_server_name
}
output "sql_server_id" {
  value = module.Azure_SQL.sql_server_id
}
output "sql_database_name" {
  value = module.Azure_SQL.sql_database_name
}
output "sql_database_id" {
  value = module.Azure_SQL.sql_database_id
}