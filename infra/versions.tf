terraform {
  required_version = "~> 1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60"
    }
  }
 
  backend "s3" {
    bucket         = "group1a-tfstate-953305038374"   # YOUR bucket
    key            = "infra/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "group1a-tflock"                 # YOUR table
    encrypt        = true
  }

}

provider "aws" {
  region = "eu-west-1"
  # Every resource gets these tags without you writing them each time.
  # The Group tag is what makes per-group cost reporting possible.
  default_tags {
    tags = {
      Group     = "group1a"
      Programme = "cloud-internship"
      ManagedBy = "terraform"
    }
  }

}
