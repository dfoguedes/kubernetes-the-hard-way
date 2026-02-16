
resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {

    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    network = "default"
    # subnetwork = google_compute_subnetwork.this.name
    access_config {
    }
  }
  metadata_startup_script = var.metadata_startup_script
}
# resource "google_compute_subnetwork" "this" {
#   name          = "default"
#   ip_cidr_range = "10.0.0.0/16"
#   region        = var.region
#   network       = "default"
# }
