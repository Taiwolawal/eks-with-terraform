



resource "aws_dynamodb_table" "terraform_locks" {
  name         = "state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = "eks-terraform-prj24"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-locking"
    encrypt        = true
  }
}