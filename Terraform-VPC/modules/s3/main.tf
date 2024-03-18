# s3 bucket for storing Elastic Bean stalk code builds
resource "aws_s3_bucket" "split_elastic_beanstalk_deploy" {
  bucket = "split_elastic_beanstalk_deploy"

  tags = {
    Name        = "Split a bill Elastic beanstalk bucket"
  }
}