output "maris-ec2-public-ip" {
  description = "The ID of the created EC2 instance"
  value       = module.maris-test-ec2instance.maris-ec2-public-ip
}