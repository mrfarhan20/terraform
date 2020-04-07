resource "aws_elb" "burgasm-elb" {
  name               = "burgasm-elb"
  subnets            = "${aws_subnet.burgasm-subnet.*.id}"
  security_groups   = ["${aws_security_group.burgasm-sg.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = "${aws_instance.burgasm-ec2.*.id}"
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "burgasm-elb"
  }
}