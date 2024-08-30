

packer {
  required_plugins {
    vmware = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/vmware"
    }
    vagrant = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}


source "vmware-iso" "centos" {
  iso_urls = [
    "CentOS-7-x86_64-Minimal-2009.iso",
    "https://img.cs.montana.edu/linux/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-Minimal-2009.iso"
  ]
  iso_checksum     = "sha256:07b94e6b1a0b0260b94c83d6bb76b26bf7a310dc78d7a9c7432809fb9bc6194a"
  ssh_username     = "vagrant"
  ssh_password     = "vagrant"
  shutdown_command = "echo 'vagrant' | sudo -S shutdown -P now"
  vm_name          = "packer-centos-vmware"
  guest_os_type    = "centos7-64"
  disk_size        = 40960
  headless         = false
  http_directory   = "http"
  boot_command = [
    "<esc><wait>",
    "linux ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter>"
  ]
  vmx_data = {
    "memsize"  = "1024"
    "numvcpus" = "2"
  }
}

build {
  sources = ["source.vmware-iso.centos"]

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
    output = "builds/{{.Provider}}-centos-7-ansible-vmware.box"
  }

  post-processor "vagrant-cloud" {
    box_tag      = "ulrichnoumsi98/centos-7-ansible-vmware"
    version      = var.version
    access_token = var.vagrant_cloud_token
  }
}
}
