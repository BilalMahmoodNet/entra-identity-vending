variable "vending_prefix" {
  type        = string
  description = "Pre-fix"
  default     = "VENDING"
  # Used for naming the groups, e.g. "VENDING-Cloud-Ops-PROD-GRP"
}

variable "team_names" {
  type        = list(string)
  description = "List of teams to create identity groups for"
  # List of teams to create groups for.
  default = ["Cloud-Platform", "Cloud-Ops"]
}

variable "env" {
  type        = string
  description = "The environment suffix (DEV/PROD)"
}