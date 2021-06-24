provider "aws" {
  alias = "test"
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::753739125648:role/TerraformAutomationRole"
    session_name = "terraform-cicd"
  }
}

resource "aws_s3_bucket" "b" {
  provider = aws.test 
  bucket   = "my-tf-test-bucket-570433319396"
  tags     = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
