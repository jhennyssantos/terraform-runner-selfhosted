# Configure Terraform to use the local backend
terraform {
  backend "s3" {
    bucket         = "tfstate-jheni-lab"
    key            = "runners/ephemeral.tfstate"
    region         = "us-east-1"
  }
}
