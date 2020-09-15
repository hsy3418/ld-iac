terraform {
  backend "gcs" {
    bucket  = "heaven-2-tf-state"
    prefix  = "terraform/state"
  }
}