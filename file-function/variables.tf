variable "aws_region" {
    type = string
    description = "The region in which aws resources is going to be created"
    default = "ap-south-1"
}

variable "instance_type"{
    type = string
    default = "t2.micro"
}

variable "key_pair" {
    type = string
    default = "sunil"
}

