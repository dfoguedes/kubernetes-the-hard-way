terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.19.0"
    }
  }
}
provider "google" {
  project = var.project_id
  region  = var.region
}


module "jumpserver" {
  source                  = "./modules/linux-vm"
  project_id              = var.project_id
  region                  = var.region
  zone                    = var.zone
  instance_name           = "jumpbox"
  machine_type            = "e2-micro"
  metadata_startup_script = file("${path.root}/scripts/jumpserver.sh")
}

module "server" {
  source        = "./modules/linux-vm"
  project_id    = var.project_id
  region        = var.region
  zone          = var.zone
  instance_name = "server"
  machine_type  = "e2-medium"
}

module "node0" {
  source        = "./modules/linux-vm"
  project_id    = var.project_id
  region        = var.region
  zone          = var.zone
  instance_name = "node-0"
  machine_type  = "e2-medium"
}

module "node1" {
  source        = "./modules/linux-vm"
  project_id    = var.project_id
  region        = var.region
  zone          = var.zone
  instance_name = "node-1"
  machine_type  = "e2-medium"
}
