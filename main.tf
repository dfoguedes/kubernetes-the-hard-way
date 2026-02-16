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
