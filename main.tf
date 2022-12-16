terraform {
  cloud {
    organization = "itisaby"

    workspaces {
      name = "vcs-terraform"
    }
  }
}


provider "aws" {
  # Configuration options
  region = "us-east-1"
}

module "apache" {
  source        = "itisaby/apache/aws"
  vpc_id        = var.vpc_id
  instance_type = var.instance_type
  public_key    = var.public_key
  server_name   = var.server_name

}

output "name" {
  value = module.apache.public_ip
}

