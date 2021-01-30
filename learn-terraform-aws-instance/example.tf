// terraform block is required so Terraform knows which provider to download
// from the Terraform Registry.
// cf. https://registry.terraform.io
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

// provider block configures the named provider, which is responsible for
// creating and managing resources.
provider "aws" {
  profile = "default"
  region  = var.region
}

// resource block defines a piece of infrastructure. A resource might be a
// physical component such as an EC2 instance, or it can be a logical resource
// such as a Heroku application.
resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example.id
}

output "ami" {
  value = aws_instance.example.ami
}
