# Variabile pentru aws_organizations_organization.org
variable "create_organization" {
  description = "(Required) Set to true if an organization should be created or to false otherwise."
  type        = bool
}

variable "aws_service_access_principals" {
  description = "(Optional) List of AWS service principal names for which you want to enable integration with your organization. This is typically in the form of a URL, such as service-abbreviation.amazonaws.com."
  type        = list(string)
  default     = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
  ]
}

variable "enabled_policy_types" {
  description = "(Optional) List of Organizations policy types to enable in the Organization Root. Organization must have feature_set set to ALL. For additional information about valid policy types (e.g. AISERVICES_OPT_OUT_POLICY, BACKUP_POLICY, SERVICE_CONTROL_POLICY, and TAG_POLICY)"
  type        = list(string)
  default     = [ "AISERVICES_OPT_OUT_POLICY", "BACKUP_POLICY", "SERVICE_CONTROL_POLICY", "TAG_POLICY"]
}

variable "feature_set" {
  description = "(Optional) Specify \"ALL\" (default) or \"CONSOLIDATED_BILLING\"."
  type        = string
  default     = "ALL"
}

# Variabile pentru aws_organizations_organizational_unit.ou
variable "organizational_units" {
  description = "(Optional) List of maps that contain organizational unit configuration details: organizational unit name and parent id"
  type        = list(map(string))
}

# Variabile pentru aws_organizations_account.account
variable "member_accounts" {
  description = "(Optional) List of map of configurations for accounts that should be created. See terraform.tfvars for an example" 
  type        = list(map(string))
}
