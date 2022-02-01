# Azure provider with Terraform recipes

## Before you start

I do like running everything in a separated context (Docker container) instead of messing-up my machine by installing packages etc.

Before doing anything, I first start a Docker container based on Ubuntu

```shell
docker run --rm -it -v $(pwd):/root -w /root ubuntu:latest /bin/bash
```

> I'm running the container as root, but you can use another account if you prefer

From the Docker container terminal, install some packages

```shell
apt-get update && apt-get install -y vim curl sudo 
```

Install Azure cli (see [https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt))

```shell
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

Login to Azure

```shell
az login
```

Install Terraform cli (see [https://learn.hashicorp.com/tutorials/terraform/install-cli](https://learn.hashicorp.com/tutorials/terraform/install-cli)

```shell
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```

Validate Terraform cli installation

```shell
terraform -help
```

## Recipes

### k3s cluster on Azure

[Provision k3s cluster on Azure using Terraform Azure provider](azure-k3s/README.md)