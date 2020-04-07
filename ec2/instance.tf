resource "aws_key_pair" "tf-key" {
  key_name   = "tf-key"
  public_key = "${file("tf-demo.pub")}"
}
resource "aws_instance" "web-new" {
  instance_type = "${var.instance_type}"
  key_name      = "${aws_key_pair.tf-key.key_name}"
  ami           = "${lookup(var.ami, var.aws_region)}"
}
resource "aws_instance" "web" {
  count         = "${var.instance_count}"
  ami           = "${lookup(var.ami, var.aws_region)}"
  instance_type = "${var.instance_type}"
  key_name      = "${aws_key_pair.tf-key.key_name}"
  user_data     = "${file("userdata.sh")}"

  tags = {
    Name = "Terraform-${count.index + 1}"
    App  = "${element(var.instance_tags, count.index)}"
  }
}
