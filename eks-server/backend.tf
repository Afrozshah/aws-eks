terraform {
    backend "s3" {
        bucket = "eks-ak02"
        key = "eks/terraform.tf"
        region = "us-east-1"
    }
}