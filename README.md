# kubernetes-the-hard-way

This repository follows the "Kubernetes the Hard Way" tutorial, automating the setup of a Kubernetes cluster from scratch for educational purposes.

## Repository Structure

- `Vagrantfile`: Vagrant configuration for provisioning local VMs.
- `scripts/`: Contains setup and automation scripts.
- `.gitignore`: Ensures that local state and provider files (such as `.terraform/`) are not committed.

## Large File Issue

If you encounter errors when pushing to GitHub due to large files (e.g., Terraform provider binaries), follow these steps:

1. **Do not commit `.terraform/` or other generated files.**
   - `.terraform/` is already in `.gitignore`.
2. **If a large file was committed:**
   - Use [git-filter-repo](https://github.com/newren/git-filter-repo) or [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) to remove it from your git history.
   - Example with git-filter-repo:
     ```sh
     git filter-repo --path .terraform/providers/registry.terraform.io/hashicorp/google/7.19.0/linux_amd64/terraform-provider-google_v7.19.0_x5 --invert-paths
     git push origin main --force
     ```

## References
- [Kubernetes the Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way)
- [GitHub Large File Storage](https://git-lfs.github.com/)

## License
MIT
