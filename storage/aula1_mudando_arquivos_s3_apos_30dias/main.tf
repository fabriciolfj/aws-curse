provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "awscookbook301" {
  bucket = "test-flfj124"

  tags = {
    Name        = "test-flfj124"
    Environment = "Dev"
  }
}