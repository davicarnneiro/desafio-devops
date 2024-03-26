# Set a cloud provider
provider "aws" {
  region  = var.aws_region
  profile = "default"
}

terraform {
  # backend "s3" {
  #   bucket  = "SUA_BUCKET_S3"
  #   key     = "CAMINHO_PARA_ARMAZENAR_SEU/terraform.tfstate"
  #   region  = "SUA_REGIAO"
  #   profile = "default"
  # }
  required_providers {
    aws = ">= 2.53.0"
  }
}
