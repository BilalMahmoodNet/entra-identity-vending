# This resource requires 'RoleManagement.ReadWrite.Directory' permissions
resource "azuread_group" "vending_group" {
  display_name       = "VENDED-${var.team_name}-${var.env}-GRP"
  security_enabled   = true
 # assignable_to_role = true # The secret sauce for PIM
  description        = "Security group vended for ${var.team_name} in ${var.env}"
}

output "vended_group_id" {
  value = azuread_group.vending_group.object_id
}