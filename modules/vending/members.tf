# This file links the groups created in groups.tf to your user in Azure AD, making you a member of those groups.

data "azuread_client_config" "current" {}

resource "azuread_group_member" "vending_membership" {
  # Loop over the same teams as the groups
  for_each = toset(var.team_names)

  # Link to the group in groups.tf using the same 'each.key' from the loop and grabbing the object_id
  group_object_id = azuread_group.vending_group[each.key].object_id

  # Assign to Object ID of the current user (you) using the Azure AD provider's built in data source
  member_object_id = data.azuread_client_config.current.object_id
}

