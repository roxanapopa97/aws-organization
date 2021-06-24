output "all_accounts" {
  description = "List of organization accounts including the master account. For a list excluding the master account, see the non_master_accounts attribute. All elements have these attributes: arn - ARN of the account, email - Email of the account, id - Identifier of the account, name - Name of the account, status - Current status of the account"
  value       = aws_organizations_organization.org[0].accounts
}

output "organization_arn" {
  description = "ARN of the organization"
  value       = aws_organizations_organization.org[0].arn
}

output "organization_id" {
  description = "Identifier of the organization"
  value       = aws_organizations_organization.org[0].id
}

output "master_account_arn" {
  description = "ARN of the master account"
  value       = aws_organizations_organization.org[0].master_account_arn
}

output "master_account_email" {
  description = "Email address of the master account"
  value       = aws_organizations_organization.org[0].master_account_email
}

output "master_account_id" {
  description = "Identifier of the master account"
  value       = aws_organizations_organization.org[0].master_account_id
}

output "non_master_accounts" {
  description = "List of organization accounts excluding the master account. For a list including the master account, see the accounts attribute. All elements have these attributes: arn - ARN of the account, email - Email of the account, id - Identifier of the account, name - Name of the account, status - Current status of the account"
  value       = aws_organizations_organization.org[0].non_master_accounts
}

output "roots" {
  description = "List of organization roots. All elements have these attributes: arn - ARN of the root, id - Identifier of the root, name - Name of the root, policy_types - List of policy types enabled for this root. All elements have these attributes: name - The name of the policy, type status - The status of the policy type as it relates to the associated root"
  value       = aws_organizations_organization.org[0].roots
}

output "accounts_ids" {
  description = "ID's of the created accounts"
  value = toset([
    for account in aws_organizations_account.account : account.id
  ])
}

output "accounts_arns" {
  description = "ARN's of the created accounts"
  value = toset([
    for account in aws_organizations_account.account : account.arn
  ])
}

output "accounts_info" {
  description = "ARN's and ID's of the created accounts"
  value = aws_organizations_account.account[*]
}
