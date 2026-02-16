output "virtual_network_name" {
  description = "The name of the created Virtual Private Cloud (VPC) network."
  value       = google_compute_network.this.name
}

output "subnet_name" {
  description = "The name of the created subnetwork within the VPC."
  value       = google_compute_subnetwork.this.name
}
