
# This file defines the groups that will be created in Azure AD for each team.
resource "azuread_group" "vending_group" {
  for_each = toset(var.team_names) 


  # The display name of the group is built using the variables defined in variables.tf, creating a consistent naming convention.
  display_name     = "${var.vending_prefix}-${each.value}-${var.env}-GRP"
  security_enabled = true
  description      = "Team: ${each.value} | Env: ${var.env} | ManagedBy: Terraform | CostCenter: 12345"
 

}
# This data source is used to get the subscription ID for the role assignment in roles.tf. It ensures that the role assignment is made at the correct scope.
data "azurerm_subscription" "primary" {}

# This output is useful for debugging and verification, allowing you to see the object IDs of the groups that were created after running 'terraform apply'.
output "vended_group_ids" {
  value = { for k, v in azuread_group.vending_group : k => v.object_id }
}
