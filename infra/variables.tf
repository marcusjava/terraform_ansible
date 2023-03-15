variable "aws_region" {
  type        = string
  description = "Region in AWS"

}

variable "ssh-key" {
  type        = string
  description = "Name SSH key"
}

variable "instance" {
  type = string
  description = "Instance types (e.g. t2-micro)"
}


variable "instance_name" {
  type = string
  description = "Machine name"
}