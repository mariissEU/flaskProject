variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}
variable "key" {
  description = "Default Maris Key"
  type        = string
  default     = "marisL"
}
variable "tags" {
  description = "A map of tags to apply to AWS resources."
  type        = map(string)
  default     = {
    Owner        = "Maris Liepins"
    Environment  = "Development"
  }
}
variable "subnet_id_var" {
  description = "Subnet ID var from VPC"
  type        = string
}
variable "vpc_security_group_id_var" {
  description = "VPC sec group"
  type        = string
}