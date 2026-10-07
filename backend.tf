terraform {
  backend "s3" {
    bucket       = "mrinal7-test-tfstate"
    key          = "demo/terraform.tfstate"
    region       = "us-west-2"
    use_lockfile = true


  }

}