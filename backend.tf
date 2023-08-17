terraform {
  backend "s3" {
    bucket         = "terraform-tfstate-shams"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    profile        = "default"
    dynamodb_table = "test-db"
  }
}
