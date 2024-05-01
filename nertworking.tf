resource "azurerm_virtual_network" "onas_vnet" {
  name                = "thisonas_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.onas_rg.location
  resource_group_name = azurerm_resource_group.onas_rg.name
}

resource "azurerm_subnet" "onas_subnet" {
  name                 = "thisonas_subnet"
  resource_group_name  = azurerm_resource_group.onas_rg.name
  virtual_network_name = azurerm_virtual_network.onas_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "onas_nic" {
  name                = "thisonas_nic"
  location            = azurerm_resource_group.onas_rg.location
  resource_group_name = azurerm_resource_group.onas_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.onas_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.onas_pip.id
  }
}
resource "azurerm_public_ip" "onas_pip" {
  name                = "thisonas_public_ip"
  resource_group_name = azurerm_resource_group.onas_rg.name
  location            = azurerm_resource_group.onas_rg.location
  allocation_method   = "Static"
}
