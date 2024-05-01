resource "azurerm_mysql_flexible_server" "onas_mysqlflexibleserv" {
  name                   = "thisonas-mysqlflexibleserv"
  resource_group_name    = azurerm_resource_group.onas_rg.name
  location               = azurerm_resource_group.onas_rg.location
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  backup_retention_days  = 7
  delegated_subnet_id    = azurerm_subnet.onas_subnet.id
  sku_name               = "GP_Standard_D2ds_v4"
  tags = local.tags
}
resource "azurerm_mysql_flexible_database" "onas_flexdbs" {
  name                = "thisonas_flexdbs"
  resource_group_name = azurerm_resource_group.onas_rg.name
  server_name         = azurerm_mysql_flexible_server.onas_mysqlflexibleserv.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
