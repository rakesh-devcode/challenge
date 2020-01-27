# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name = "kp_devops"
  public_key = "${file("${var.key_path}")}"
}

# Define webserver inside the public subnet
resource "aws_instance" "wb" {
   ami  = "${var.ami}"
   instance_type = "t2.micro"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   associate_public_ip_address = true
   user_data = "${file("install.sh")}"

  tags = {
    Name = "ec2_devops"
  }
}
