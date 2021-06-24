create_organization = true
organizational_units = {
  "prod_organizational_unit" : {
    "name"      : "prod",
    "parent_id" : "r-50gs"
  },
  "dev_organizational_unit" : {
    "name"      : "dev",
    "parent_id" : "r-50gs"
  },
  "audit_organizational_unit" : {
    "name"      : "audit",
    "parent_id" : "r-50gs"
  }
}
member_accounts = {
  "prod_account" : {
    "name"  : "prod",         
    "email" : "terraformtestcicd+prod@gmail.com",
    "has_access_to_billing" : "DENY",
    "ou_name" : "prod",
    "role_name" : "TerraformAutomationRole"
  },
  "dev_account" : {
    "name"  : "dev",         
    "email" : "terraformtestcicd+dev@gmail.com",
    "has_access_to_billing" : "DENY",
    "ou_name" : "dev",
    "role_name" : "TerraformAutomationRole"
  },
  "audit_account" : {
    "name"  : "audit",         
    "email" : "terraformtestcicd+audit@gmail.com",
    "has_access_to_billing" : "ALLOW",
    "ou_name" : "audit",
    "role_name" : "TerraformAutomationRole"
  }
}