output "id1" {
   value = random_uuid.id1.result
}

output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.web_server.public_ip
}

output "password" {
  value     = "secret"
  sensitive = true
}
