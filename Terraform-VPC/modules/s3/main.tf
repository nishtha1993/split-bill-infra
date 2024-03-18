# s3 bucket for storing Elastic Bean stalk code builds
resource "aws_s3_bucket" "split-elastic-beanstalk-deploy-bucket" {
  bucket = "split-elastic-beanstalk-deploy-bucket"

  tags = {
    Name        = "Split a bill Elastic beanstalk bucket"
  }
}