# This file defines the roles that is assigned to the groups created in groups.tf.
data "azurerm_role_definition" "reader" {
  name = "Reader"
}

resource "azurerm_role_assignment" "vending_reader" {
  for_each = toset(var.team_names)
  scope = data.azurerm_subscription.primary.id
  # Populate the role definition ID using the data source we created to look up the built in Reader role. This ensures it works across any tenant without hardcoding IDs.
  role_definition_id = data.azurerm_role_definition.reader.id
  principal_id = azuread_group.vending_group[each.key].object_id
}