![packer](image.png)

# Build d'images avec Packer

Ce dépôt est dédié à la création d'images à l'aide de Packer.

**NB :** Pour chacune des plateformes sur lesquelles vous souhaitez créer une image, il y a certaines recommandations à suivre. Veuillez consulter le fichier `notes.txt` pour plus de détails sur chaque plateforme.

## Comment ça marche ?

Packer de HashiCorp est un outil polyvalent qui permet aux utilisateurs d'automatiser la création de machines virtuelles sur plusieurs plateformes. Il prend en charge différents constructeurs, ce qui lui permet de générer des images pour divers environnements à partir d'une configuration unique.

### Plateformes supportées par Packer

Packer peut construire des images pour une large gamme de plateformes, y compris :

- **Fournisseurs de Cloud :**
  - AWS (Amazon Web Services)
  - Azure
  - Google Cloud Platform
  - DigitalOcean

- **Plateformes de virtualisation :**
  - VMware
  - VirtualBox
  - Hyper-V

- **Plateformes de conteneurs :**
  - Docker
  - Kubernetes

- **Autres environnements :**
  - OpenStack
  - QEMU
  - CloudStack

## Mise en place

### Installation de Packer

Packer est disponible sur plusieurs plateformes :
- Linux
- Windows

Lien : [Installation de Packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)

### Récupération du code source

Vous avez deux options :
- Forker le dépôt
- Cloner le dépôt

### Commandes utiles

```bash
packer init
packer fmt
packer build
```
Si ce dépôt GitHub t’est utile, laisse une étoile.