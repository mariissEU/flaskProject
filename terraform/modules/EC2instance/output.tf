output "maris-ec2-public-ip" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.maris-test-ec2instance[count.index].public_ip
}