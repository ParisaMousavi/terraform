
provider "aws"{
    region = "eu-west-1"
    access_key = "AKIA2KKYIFXPCBEQCERI"
    secret_key = "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"
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "parisa-demo-tf-log-bucket"
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket" "b" {
  #bucket = "parisa-demo-tf-test-bucket"
  acl    = "private"
  tags = {
    Name        = "My demo bucket"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }  

  count = 2
}

/*
    Reference:
        - https://www.youtube.com/watch?v=VvKoYRWXPAw

    Commands:
        - terraform init
        - terraform plan -out tfplan-1.0
        - terraform tfplan-1.0
        - terraform version : for debudding
        - terraform show
*/