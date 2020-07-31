terraform {
    required_version = "~> 0.13.0"
    backend "remote" {
        organization = "TFTMM"
        workspaces { name = "varvalidation-demo"}
    }

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "2.70.0"
        }
    }
}

variable "aws_region" {
    # validation {
    #     condition = length(var.aws_region) == 9 && substr()
    #     error_message = ""
    # }
}

provider "aws"{
    region = var.aws_region
    alias = "hashi"
}

module "s3-module" {
    source = "app.terraform.io/TFTMM/s3-module/aws"
    provider = {
        aws = aws.hashi
    }
    
}