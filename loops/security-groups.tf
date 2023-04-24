resource "aws_security_group" "app-sg-ssh" {
    name = "app-sg"
   
    description = "ssh-security group"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "app-sg-web" {
    name = "ssh-gg-web"
    
    description = "web - securitygroup"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress{
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}