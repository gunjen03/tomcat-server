
resource "aws_lb" "ALB-tomcat" {
  name               = "${var.name}-ALB-tomcat"
  internal           = false
  subnets            = ["${var.public_subnet_1_id}", "${var.public_subnet_2_id}"]
  security_groups    = ["${aws_security_group.allow_ssh_http.id}"]
  load_balancer_type = "application"

  tags = {
    Name = "${var.name}-ngnix-2"
  }
}

resource "aws_lb_listener" "ALB-tomcat" {
  load_balancer_arn = aws_lb.ALB-tomcat.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_nginx_2.arn
  }
}
resource "aws_lb_target_group" "tg_nginx_2" {
  name     = "${var.name}-ALB-tomcat"
  vpc_id   = var.vpc_id
  port     = 8080
  protocol = "HTTP"

  health_check {
    protocol          = "HTTP"
    port              = "traffic-port"
    healthy_threshold = 3
  }
}