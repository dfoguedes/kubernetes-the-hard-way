
resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = var.machine_type
  boot_disk {

    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
}
