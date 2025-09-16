output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_account_primary_endpoint" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}
# ---------- Outputs ----------
output "lb_public_ip" {
  value = azurerm_public_ip.lb_pip.ip_address
}

output "vm1_public_ip" {
  value = azurerm_public_ip.vm_pip.ip_address
}

output "vm2_public_ip" {
  value = azurerm_public_ip.vm2_pip.ip_address
}
