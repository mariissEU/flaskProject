output "maris-ec2-public-ip" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.maris-test-ec2instance[0].public_ip
}