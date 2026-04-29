

# Create the S3 Bucket for Web Hosting
resource "aws_s3_bucket" "website_bucket" {
  bucket = "my-devops-project-2-store" 
  tags = {
    Environment = "Production"
    Project     = "Static-Web-Automation"
  }
}

# Website Configuration for hosting
resource "aws_s3_bucket_website_configuration" "site_config" {
  bucket = aws_s3_bucket.website_bucket.id
  index_document { suffix = "index.html" }
}

# Grant Public Access Control to the bucket (Security Configuration)
resource "aws_s3_bucket_public_access_block" "public" {
  bucket                  = aws_s3_bucket.website_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}