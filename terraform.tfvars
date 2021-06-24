create_organization = true
organizational_units = [
  {
    name      = "prod"
    parent_id = "r-50gs"
  },
  {
    name      = "dev"
    parent_id = "r-50gs"
  },
  {
    name      = "audit"
    parent_id = "r-50gs"
  }
]
member_accounts = [
  {
    name  = "prod"         
    email = "terraformtestcicd+prod@gmail.com"
    has_access_to_billing = "false"
    ou_id = "prod"
    role_name = "TerraformAutomationRole"
  },
  {
    name  = "dev"         
    email = "terraformtestcicd+dev@gmail.com"
    has_access_to_billing = "false"
    ou_id = "dev"
    role_name = "TerraformAutomationRole"
  },
  {
    name  = "audit"         
    email = "terraformtestcicd+audit@gmail.com"
    has_access_to_billing = "true"
    ou_id = "audit"
    role_name = "TerraformAutomationRole"
  }
]