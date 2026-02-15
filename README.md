# Kubernetes The Hard Way (Terraform Edition)

This project provides an automated, step-by-step approach to deploying a Kubernetes cluster from scratch using Terraform. It is designed for users who want to understand the inner workings of Kubernetes infrastructure by building each component manually, but with the convenience and repeatability of Infrastructure as Code.

## Project Overview

- **Infrastructure as Code:** All resources are defined using Terraform modules for easy management and reproducibility.
- **Modular Design:** Each major component (control plane, worker nodes, jumpbox) is defined as a separate module for clarity and reusability.
- **Cloud Agnostic:** The structure can be adapted to different cloud providers or on-premise environments with minimal changes.
- **Educational Focus:** The project is ideal for learning, experimentation, and gaining a deep understanding of Kubernetes cluster setup and operations.

## Architecture

The cluster consists of:

| Name    | Role                     | vCPU | RAM   | Disk |
| ------- | ------------------------ | ---- | ----- | ---- |
| jumpbox | Administration host      | 1    | 512MB | 10GB |
| server  | Kubernetes control plane | 1    | 2GB   | 20GB |
| node-0  | Kubernetes worker node   | 1    | 2GB   | 20GB |
| node-1  | Kubernetes worker node   | 1    | 2GB   | 20GB |

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- Access to a supported cloud provider or virtualization platform
- Basic knowledge of Kubernetes and Terraform

### Usage

1. Clone this repository:
   ```sh
   git clone https://github.com/dfoguedes/kubernetes-the-hard-way.git
   cd kubernetes-the-hard-way
   ```
2. Initialize Terraform:
   ```sh
   terraform init
   ```
3. Review and customize variables in `terraform.tfvars` as needed.
4. Apply the configuration:
   ```sh
   terraform apply
   ```
5. Follow the output instructions to access your jumpbox and continue with manual cluster bootstrapping steps if required.

## Directory Structure

- `main.tf` – Main Terraform configuration
- `variables.tf` – Input variables
- `terraform.tfvars` – Variable values (should be gitignored if containing secrets)
- `modules/` – Contains reusable Terraform modules (e.g., `linux-vm`)
- `scripts/` – Helper scripts for provisioning each component

## Notes

- This project is intended for educational and experimental use. For production deployments, further security and scalability considerations are required.
- Sensitive files and Terraform state are excluded from version control via `.gitignore`.

## License

This project is open source and available under the MIT License.
