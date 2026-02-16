
variable "project_id" {
  description = "The ID of the Google Cloud project where resources will be created."
}

variable "zone" {
  description = "The Google Cloud zone in which to deploy the Linux VM instance."
}
variable "region" {
  description = "The Google Cloud region for resource deployment. Must match the region of the VPC and subnetwork."
}

variable "instance_name" {
  description = "The name to assign to the Linux VM instance."
}
variable "machine_type" {
  description = "The machine type to use for the Linux VM instance (e.g., e2-micro, n1-standard-1)."
  default     = "e2-micro"
}
variable "metadata_startup_script" {
  description = "Optional startup script to be executed on VM boot. Useful for provisioning or configuration."
  default     = ""
}
variable "vpc_name" {
  description = "The name of the Virtual Private Cloud (VPC) network to which the VM will be attached."
}
variable "subnetwork_name" {
  description = "The name of the subnetwork within the VPC for the VM instance."
}
