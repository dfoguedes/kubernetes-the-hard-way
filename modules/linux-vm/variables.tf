
variable "project_id" {
  description = "Google project id"
}

variable "region" {
  description = "Google region"
}

variable "instance_name" {
  description = "Linux instance name"
}
variable "machine_type" {
  description = "Linux machine type"
  default     = "e2-micro"
}
