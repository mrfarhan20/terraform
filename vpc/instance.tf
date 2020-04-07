resource "aws_key_pair" "burgasm-kp" {
  key_name   = "burgasm-kp"
  public_key = "${file("burgasm.pub")}"
}

resource "aws_instance" "burgasm-ec2" {
  count                       = "${length(var.subnet_cidr)}"
  ami                         = "${lookup(var.ami, var.aws_region)}"
  instance_type               = "${var.instance_type}"
  user_data                   = "${file("userdata.sh")}"
  key_name                    = "${aws_key_pair.burgasm-kp.key_name}"
  subnet_id                   = "${element(aws_subnet.burgasm-subnet.*.id, count.index)}"
  vpc_security_group_ids             = ["${aws_security_group.burgasm-sg.id}"]
#   associate_public_ip_address = "true"



  tags = {
    Name = "Burgasm-Web${count.index + 1}"
  }
}