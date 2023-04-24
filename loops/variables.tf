variable "aws_region" {
    type = string
    description = "The region in which aws resources is going to be created"
    default = "us-east-1"
}

variable "instance_type"{
    type = string
    default = "t2.micro"
}

variable "key_pair" {
    type = string
    default = "sunil"
}

variable "instance_type_list" {
    type = list(string)
    default = [ "t2.micro", "t3.micro" ]
}

variable "instance_type_map" {
    type = map(string)
    default = {
      "dev" = "t2.micro"
      "qa" = "t3.micro"
      "prod" = "t2.small"
    }
}

variable "iterations" {
    type = string
    default = 2
}