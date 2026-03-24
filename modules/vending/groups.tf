
# 2. Use 'for_each' to create a group for EVERY team in that list
resource "azuread_group" "vending_group" {
  for_each = toset(var.team_names) # This tells TF to loop


  # Now we use 'each.value' to grab the name from the list
  display_name     = "${var.vending_prefix}-${each.value}-${var.env}-GRP"
  security_enabled = true
  description      = "Vended group for the ${each.value} team."
}

# 3. Update the output to show ALL the IDs
output "vended_group_ids" {
  value = { for k, v in azuread_group.vending_group : k => v.object_id }
}
