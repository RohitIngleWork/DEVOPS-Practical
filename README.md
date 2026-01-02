DEVOPS Practical

This repository contains the practical DevOps project used for coursework and demonstrations. It includes infrastructure-as-code, configuration management, image builds, containerization, and Kubernetes deployment examples.

**Contents**
- `ansible/` — Ansible configuration and a playbook to provision and configure the webserver and deploy `files/index.html`.
- `app/` — Simple web application and a `Dockerfile` used to build a container image serving `index.html`.
- `k8s/` — Kubernetes manifests (`deployment.yaml`, `service.yaml`) to run the app on a cluster.
- `packer/` — Packer template (`webserver.pkr.hcl`) to build a VM image for the webserver.
- `terraform/` — Terraform configuration to provision cloud resources required by the exercises.

Purpose
- Demonstrate a pipeline from provisioning and image-building to configuration management and containerized deployment.

Prerequisites (examples)
- `git`, `docker`, `kubectl`, `ansible`, `packer`, `terraform`.
- A Kubernetes cluster (minikube / kind / cloud cluster) for `k8s/` manifests.

Quick Start (examples)

Clone the repository:

```bash
git clone <repo-url>
cd "Devops Practical" # adjust path if necessary
```

Build the Docker image (from `app/`):

```bash
cd app
docker build -t devops-practical-web:latest .
```

Run the Ansible playbook (example):

```bash
cd ../ansible
ansible-playbook -i hosts playbook.yml
```

Build the Packer image:

```bash
cd ../packer
packer build webserver.pkr.hcl
```

Terraform (example provisioning):

```bash
cd ../terraform
terraform init
terraform plan
terraform apply
```

Deploy to Kubernetes (example):

```bash
cd ../k8s
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

Notes
- Avoid committing secrets or credentials. See `.gitignore` for ignored patterns (Terraform state, editor files, keys, etc.).
- Edit inventories and provider credentials before running Ansible/Terraform/Packer.

Contribution / Next steps
- Add repository URL, CI/CD instructions, and environment-specific notes here.

---
Last updated: 2026-01-02
Devops Practical - infra + config + image + container pipeline
