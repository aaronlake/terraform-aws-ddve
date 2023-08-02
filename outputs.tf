output "instance_id" {
  description = "InstanceId of the newly created EC2 instance"
  value       = aws_instance.ddve_ec2_instance.arn
}

output "username" {
  description = "The user name to use SSH or DDSM(GUI) to connect to DDVE"
  value       = "sysadmin"
}

output "password" {
  description = "The password to use SSH or DDSM(GUI) to connect to DDVE"
  value       = aws_instance.ddve_ec2_instance.arn
}

output "private_ip" {
  description = "The prviate IP of DDVE"
  value       = aws_instance.ddve_ec2_instance.private_ip
}

output "private_dns_name" {
  description = "The prviate DNS Name of DDVE"
  value       = aws_instance.ddve_ec2_instance.private_dns
}

output "s3_bucket" {
  description = "The name of S3 Bucket"
  value       = aws_s3_bucket.s3_bucket[0].id
}
