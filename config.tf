terraform {
  backend "s3" {
    bucket = "serverless-gunjan-s3"
    key    = "tomcatserver.tfstate"
    region = "us-east-1"
  }
}