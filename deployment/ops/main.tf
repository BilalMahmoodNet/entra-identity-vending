# This is the ONLY block you need for the Ops environment
module "ops_vending" {
  source = "../../modules/vending"

  # Explicitly define the "Truth" for this specific deployment
  vending_prefix = "Vending"
  team_names     = ["Cloud-Ops", "Dev-Ops"]
  env            = "PROD"
}