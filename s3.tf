resource "aws_s3_bucket" "demo" {
  bucket = "mrinal14-demo-bucket"
  tags = {
    Name        = "mrinal14-demo-bucket"
    Environment = "Demo"
  }
}
