terraform {
  backend "s3" {
    bucket = "project-bucket-gunjan"
    key    = "terraform-tomcatserver.tfstate"
    region = "us-east-1"
  }
}