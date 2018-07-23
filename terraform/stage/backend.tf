terraform {
  backend "gcs" {
    bucket  = "reuuke-bucket-test2"
    prefix  = "terraform/stage-state"
  }
}
