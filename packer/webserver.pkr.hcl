packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "source_ami" {
  type    = string
  default = "ami-0ecb62995f68bb549" # Ubuntu 24.04 in us-east-1 (your base)
}

source "amazon-ebs" "ubuntu_nginx" {
  region           = var.aws_region
  instance_type    = "t3.micro"
  source_ami       = var.source_ami
  ssh_username     = "ubuntu"
  ami_name         = "final-endsem-nginx-{{timestamp}}"
  ssh_interface    = "public_ip"
  associate_public_ip_address = true
}

build {
  name    = "ubuntu-nginx-ami"
  sources = ["source.amazon-ebs.ubuntu_nginx"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y nginx",
      "sudo systemctl enable nginx",
      "echo '<h1>Packer AMI — Final Endsem</h1><p>Built with Packer</p>' | sudo tee /var/www/html/index.html"
    ]
  }
}
