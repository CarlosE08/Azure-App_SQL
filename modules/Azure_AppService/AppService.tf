resource "azurerm_service_plan" "asp_wscrap" {
  name                = "ASP-${var.generate_name}-webrg01"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = var.sku_name  # tier y size combinados

  os_type = var.os_type

  tags = var.common_tags
}

resource "azurerm_windows_web_app" "web_app_wscrap" {
  name                = "${var.generate_name}-web-app-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.asp_wscrap.id

  https_only = true

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = var.connection_string_value # Cadena de conexión a la base de datos SQL
  }

  site_config {
    always_on = true
    minimum_tls_version = var.sql_tls_version
  }

  tags = var.common_tags
}

resource "null_resource" "deploy_zip" {
  provisioner "local-exec" {
    command = var.appservice_command # Example: "az webapp deploy --resource-group ${var.resource_group_name} --name ${azurerm_windows_web_app.web_app_wscrap.name} --src-path "your_app.zip" --type zip"
  }

  depends_on = [azurerm_windows_web_app.web_app_wscrap]
}
