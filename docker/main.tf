# This is part of the learning documentation from
# terraform official documentation. 
# https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli 

# Prerequisites:
# * Have docker installed locally.

# How to run:
# cd into the directory containing the `main.tf` file.
# * run `terraform init` command. 
# * run `terraform apply` or `terraform plan`

# Use the next commands to confirm the result.
# `docker ps` to list the containers

# Notes:
# * You can also confirm by openning http://localhost:8000 on your browser.
# * To destroy the container from terraform, use `terraform destroy` command.

########################################################################

# The `~>` notation installs mos recent version available.
# More info at:
# https://developer.hashicorp.com/terraform/language/expressions/version-constraints#operators
terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "~> 3.0.1"
    }
  }
}

provider "docker" {}
 
resource "docker_image" "nginx"{
name            = "nginx"
keep_locally    = false
}

# `name` property is the name the container will have.
resource "docker_container" "nginx" {
  image =   docker_image.nginx.image_id
  name  =   "tutorial"

  ports {
    internal = 80
    external = 8000
  }
}