terraform {
  backend "gcs" {
    bucket  = "reuuke-bucket-test1"
    prefix  = "terraform/stage-state"
  }
}
