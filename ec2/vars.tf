variable "aws_region" {
  default = "us-east-1"
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

variable "instance_count" {
  default = "3"
}

variable "instance_tags"{
    default = ["burgasm-web01", "burgasm-web02", "burgasm-web03"]
}


