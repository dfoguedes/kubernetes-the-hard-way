resource "google_compute_network" "this" {
  name                    = "kubernetes-the-hardway"
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  name          = "kth-subnet"
  project       = var.project_id
  ip_cidr_range = "10.240.0.0/24"
  region        = var.region
  network       = google_compute_network.this.name
}

resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = google_compute_network.this.name
  project = var.project_id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
  }
  allow {
    protocol = "udp"
  }
  source_ranges = ["10.240.0.0/24"]

}

resource "google_compute_firewall" "allow_external" {
  name    = "allow-external"
  network = google_compute_network.this.name
  project = var.project_id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22", "6443"]
  }
  source_ranges = ["0.0.0.0/0"]
}
