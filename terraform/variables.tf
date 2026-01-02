variable "aws_region" { default = "us-east-1" }
variable "key_name" { default = "final-endsem-key" }
variable "public_key_path" { default = "~/.ssh/final_endsem_key.pub" }
variable "ami_id" {
  description = "Base AMI (Ubuntu 22.04 LTS)"
  default     = "ami-0b995a912621798e7"
}
variable "instance_type" { default = "t3.micro" }
variable "my_ip_cidr" { default = "0.0.0.0/0" }
