
variable "project_id" {
  description = "Google project id"
}

variable "zone" {
  description = "Google Zone"
}
variable "region" {
  description = "Google region"
}

variable "instance_name" {
  description = "Linux instance name"
}
variable "machine_type" {
  description = "Linux instance machine type"
  default     = "e2-micro"
}
variable "metadata_startup_script" {
  description = "Metadata startup script for the Linux instance"
  default     = ""
}
 
