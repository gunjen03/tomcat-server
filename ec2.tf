provider "aws" {
  region = var.aws_region
}

resource "aws_autoscaling_group" "tomcat" {
  name              = "${var.name}-tomcat"
  min_size          = 1
  desired_capacity  = 1
  max_size          = 1
  health_check_type = "EC2"

  launch_configuration = aws_launch_configuration.tomcat.name
  vpc_zone_identifier  = ["${var.public_subnet_1_id}"]
  target_group_arns    = ["${aws_lb_target_group.tg_nginx_2.arn}"]

  tag {
    key                 = "Name"
    value               = "${var.name}-tomcat"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "tomcat" {
  image_id  = var.ami
  user_data = file("tomcat.sh")
  name_prefix                 = "${var.name}-tomcat"
  instance_type               = var.ec2_type
  key_name                    = var.ssh_keypair_name
  associate_public_ip_address = true
  enable_monitoring           = false
  security_groups = ["${aws_security_group.allow_ssh.id}"]

  root_block_device {
    volume_size = 24
  }
  lifecycle {
    create_before_destroy = true
  }
}