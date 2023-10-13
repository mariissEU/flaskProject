provider "aws" {
  region = "us-west-1"
}

# Create aws instance
resource "aws_instance" "maris-test-ec2instance" {
  ami           = "ami-0f8e81a3da6e2510a"
  instance_type = var.instance_type
  count = "1"
  key_name = var.key
  associate_public_ip_address = true
  subnet_id     = var.subnet_id_var
  vpc_security_group_ids = [var.vpc_security_group_id_var]
  tags = merge(var.tags, {
    Name = "TF - testInstanceML"
  })

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = false
    delete_on_termination = true
  }

  user_data = "${file("modules/EC2instance/init.sh")}"

}
