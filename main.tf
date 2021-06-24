resource "aws_organizations_organization" "org" {
  # Scop: 
  #   - Crearea unei organizatii AWS
  # Variabile de intrare:
  #   - Obligatorii: create_organization
  #   - Optionale: aws_service_access_principals, enabled_policy_types, feature_set
  # Variabile de iesire: all_accounts, organization_arn, organization_id, master_account_arn, master_account_email, master_account_id, non_master_accounts, roots
  # Documentatie oficiala: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization
  count = var.create_organization ? 1 : 0
  aws_service_access_principals = var.aws_service_access_principals
  enabled_policy_types = var.enabled_policy_types
  feature_set = var.feature_set
}

resource "aws_organizations_organizational_unit" "ou" {
  # Scop: 
  #   - Crearea de unitati organizationale AWS (organizational units)
  # Variabile de intrare:
  #   - Obligatorii: N/A
  #   - Optionale: organizational_units 
  # Variabile de iesire: N/A 
  # Documentatie oficiala: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit
  for_each  = toset(var.organizational_units)
  name      = each.key
  parent_id = aws_organizations_organization.org[0].roots[0].id
}

resource "aws_organizations_account" "account" {
  # Scop: 
  #   - Crearea de conturi AWS
  # Variabile de intrare:
  #   - Obligatorii: N/A
  #   - Optionale: member_accounts 
  # Variabile de iesire: accounts_arns, accounts_ids, accounts_info 
  # Documentatie oficiala: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account
  for_each = var.member_accounts
  name  = each.value.name
  email = each.value.email
  iam_user_access_to_billing = each.value.has_access_to_billing
  parent_id = aws_organizations_organizational_unit.ou[each.value.ou_name].id
  role_name = each.value.role_name
}
