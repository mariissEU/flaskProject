output "maris-test-subnet_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_subnet.maris-test-subnet.id
}
output "maris-test-sg_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_security_group.maris-test-sg.id
}