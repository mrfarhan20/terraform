variable "aws_region" {
  default = "us-east-1"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type    = "list"
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  type    = "list"
  default = ["us-east-1a", "us-east-1b"]
}
variable "ami" {
  type = "map"

  default = {

    us-east-1 = "ami-0fc61db8544a617ed"
    us-east-2 = "ami-0e01ce4ee18447327"
    us-west-1 = "ami-09a7fe78668f1e2c0"
  }
}

variable "instance_type" {
  default = "t2.micro"
}