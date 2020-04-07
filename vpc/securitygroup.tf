resource "aws_security_group" "burgasm-sg" {
  name        = "burgasm-sg"
  description = "Allow HTTP inbound traffic"
  vpc_id      = "${aws_vpc.burgasm_vpc.id}"

  ingress {
    description = "Allow Incoming HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "HTTP Ingress"
  }
}