variable "aws_region" {
  description = "Region for the VPC"
  default = "ap-southeast-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default = "10.0.2.0/24"
}

variable "ami" {
  description = "AMI for EC2"
  default = "ami-0d9233e8ce73df7b2"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "C:/Users/rakesh/Desktop/PT/AWS/ec2-instance-2019.pub"
}
