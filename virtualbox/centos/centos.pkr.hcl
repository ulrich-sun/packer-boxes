
packer {
  required_plugins {
    virtualbox = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/virtualbox"
    }
    vagrant = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

source "virtualbox-iso" "centos" {
  iso_urls           = [
    "CentOS-7-x86_64-Minimal-2009.iso",
    "https://img.cs.montana.edu/linux/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-Minimal-2009.iso"
  ]
  iso_checksum       = "sha256:07b94e6b1a0b0260b94c83d6bb76b26bf7a310dc78d7a9c7432809fb9bc6194a"
  ssh_username       = "vagrant"
  ssh_password       = "vagrant"
  shutdown_command   = "echo 'vagrant' | sudo -S shutdown -P now"
  vm_name            = "packer-centos"
  guest_os_type      = "RedHat_64"
  disk_size          = 40960
  headless           = false
  http_directory     = "http"
  boot_command       = [
    "<esc><wait>",
    "linux ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter>"
  ]
  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--memory", "1024"],
    ["modifyvm", "{{.Name}}", "--cpus", "2"]
  ]
}

build {
  sources = ["source.virtualbox-iso.centos"]

  provisioner "file" {
    source      = "./scripts/motd"
    destination = "/tmp/motd"
  }

  provisioner "shell" {
    inline = [
      "sudo mv /tmp/motd /etc/motd"
    ]
  }

  provisioner "shell" {
    scripts = ["./scripts/update.sh"]
  }

  post-processors {
    post-processor "vagrant" {
      output = "builds/{{.Provider}}-centos-7-ansible.box"
    }

    post-processor "vagrant-cloud" {
      box_tag      = "ulrichnoumsi98/centos-7-ansible"
      version      = var.version
      access_token = var.vagrant_cloud_token
    }
  }
}

