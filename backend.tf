terraform {
  backend "s3" {
    bucket       = "mrinal14-test-tfstate"
    key          = "demo/terraform.tfstate"
    region       = "us-west-1"
    use_lockfile = true


  }

}