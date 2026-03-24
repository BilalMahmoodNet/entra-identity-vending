module "ops_vending" {
  source = "../../modules/vending"

  # Pass the values specific to THIS state file
  vending_prefix = "EV-VENDING"
  team_names     = ["Cloud-Ops"]
  env            = "PROD"
}