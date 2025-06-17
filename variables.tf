variable "connection_string_value" {}
variable "resource_group_name" {}
variable "location" {}

variable "sql_password" {}
variable "sql_user" {}
variable "sql_version" {}
variable "sql_tls_version" {}

variable "database_name" {}
variable "creation_database_id" {}

variable "sku_name" {}
variable "os_type" {}

variable "appservice_command" {}

variable "aplicacion" {
  description = "Nombre de la aplicación"
  type        = string
  default     = "WSCRAP"
}

variable "region" {
  description = "Nombre corto de la región"
  type        = string
  default     = var.location
}

variable "ambiente" {
  description = "Ambiente del recurso"
  type        = string
  default     = "ndev"
}


locals {
  today         = formatdate("DD/MM/YYYY", timestamp())
  generate_name = "${var.aplicacion}-${var.region}-${var.ambiente}"

  common_tags = {
    #aplicación   = "WSCRAP"
    created_by   = "Carlos Escobar"
    contact_dl   = "carlos.escobar@example.com"
    cost_center  = "CloudOps"
    env          = "NDev"
    created_date = local.today
  }
}
