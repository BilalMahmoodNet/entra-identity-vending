variable "vending_prefix" {
  type        = string
  description = "Pre-fix"
  default     = "VENDING"
}

variable "team_names" {
  type        = list(string)
  description = "List of teams to create identity groups for"
  # You can leave the default empty or put your teams here
  default     = ["Cloud-Platform", "Cloud-Ops"] 
}

variable "env" {
  type        = string
  description = "Deployment environment"
  default     = "DEV"
}