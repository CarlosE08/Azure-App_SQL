output "App_Service_Name" {
  value = azurerm_windows_web_app.web_app_wscrap.name
}

output "App_Service_Default_Hostname" {
  value = azurerm_windows_web_app.web_app_wscrap.default_hostname
}

output "App_Service_virtual_network_ip_configuration" {
  value = azurerm_windows_web_app.web_app_wscrap.virtual_network_subnet_id
}

output "webapp_outbound_ips" {
  value = azurerm_windows_web_app.web_app_wscrap.outbound_ip_addresses
  description = "Lista de IPs de salida de la Web App"
}

