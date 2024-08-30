![packer](image.png)

# Build images with Packer

This repository is dedicated to image creation using Packer.

**For each of the platforms on which you wish to create an image, there are certain recommendations to follow. Please consult the `notes.txt` file for more details on each platform.

## How does it work?

Packer from HashiCorp is a versatile tool that enables users to automate the creation of virtual machines on multiple platforms. It supports different manufacturers, enabling it to generate images for various environments from a single configuration.

### Platforms supported by Packer

Packer can build images for a wide range of platforms, including:

- Cloud providers:**
  - AWS (Amazon Web Services)
  - Azure
  - Google Cloud Platform
  - DigitalOcean

- Virtualization platforms:**
  - VMware
  - VirtualBox
  - Hyper-V

- Container platforms:**
  - Docker
  - Kubernetes

- Other environments:**
  - OpenStack
  - QEMU
  - CloudStack

## Setting up

### Packer installation

Packer is available on several platforms:
- Linux
- Windows

Link: [Packer installation](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)

### Recovery of source code

You have two options:
- Fork the repository
- Clone the repository

### Useful commands

bash
packer init
packer fmt
packer build
```
If you find this GitHub repository useful, leave a star.