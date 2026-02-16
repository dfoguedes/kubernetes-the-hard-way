
variable "project_id" {
  description = "The ID of the Google Cloud project for all resources."
}
variable "region" {
  description = "The Google Cloud region for resource deployment. Default is 'europe-west1'."
  default     = "europe-west1"
}

variable "zone" {
  description = "The Google Cloud zone for resource deployment. Default is 'europe-west1-b'."
  default     = "europe-west1-b"
}
