terraform {
  backend "s3" {
    bucket = "talent-academy-605505651286-tfstates"
    key    = "projects/vpc/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}