resource "azurerm_resource_group" "onas_rg" {
  name     = "${local.owner}-${var.rg}-${local.environment}"
  location = var.location
  tags = local.tags
}