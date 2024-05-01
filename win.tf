resource "azurerm_windows_virtual_machine" "onas_winvm" {
  name                = var.win_vm_name
  resource_group_name = azurerm_resource_group.onas_rg.name
  location            = azurerm_resource_group.onas_rg.location
  size                = "Standard_F2"
  admin_username      = var.win_user_name
  admin_password      = var.win_password
  network_interface_ids = [
    azurerm_network_interface.onas_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  tags = local.tags
}