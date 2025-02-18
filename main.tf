terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~> 1.5"
}

provider "aws" {
  default_tags {
    tags = {
      Environment = "Production"
    }
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "teja-tf-bucket"
  tags = {
    CreadtedBy = "Teja"
  }
}