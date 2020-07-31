
/*
  Configure the AWS Provider
  Reference:
  - https://registry.terraform.io/providers/hashicorp/aws/latest/docs
*/
provider "aws" {
  version = "~> 3.0"
  region  = "eu-west-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}