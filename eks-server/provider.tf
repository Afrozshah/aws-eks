terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAW2INFOJFFSUYI44Y"
  secret_key = "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"
}