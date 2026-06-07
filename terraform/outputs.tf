/*
Desabilitando todos esses outputs e deixando apenas o public ip address de acordo com o que foi solicitado.

output "resource_group_name" {
  description = "Nome do Resource Group criado"
  value       = azurerm_resource_group.rg.name
}

output "vm_name" {
  description = "Nome da máquina virtual"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "ssh_command" {
  description = "Comando pronto para conectar na VM (a partir do Cloud Shell)"
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.pip.ip_address}"
}

output "admin_username" {
  description = "Usuário administrador da VM"
  value       = azurerm_linux_virtual_machine.vm.admin_username
}
*/

output "public_ip_address" {
  description = "IP público da VM"
  value       = azurerm_public_ip.pip.ip_address
}