resource "aws_s3_bucket" "test_bucket_all" {
    bucket = data.aws_s3_bucket.demo_s3.id

    tags = {
        Name = "s3-test-bucket"
        Environment = "Lab"
    }

    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = data.aws_s3_bucket.demo_s3.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "server_test_encryption" {
  bucket = data.aws_s3_bucket.demo_s3.id
    rule {
      apply_server_side_encryption_by_default {
        # kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "AES256"
      }
    }
  }



resource "aws_s3_bucket_public_access_block" "test_bucket_all" {
  bucket = data.aws_s3_bucket.demo_s3.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_versioning" "version_my_bucket" {
    bucket = data.aws_s3_bucket.demo_s3.id
    
    versioning_configuration {
      status = "Enabled"
    }
  
}

# resource "aws_s3_bucket_cors_configuration" "demotest" {
#   bucket = data.aws_s3_bucket.demo_cors.id

# #   cors_rule {
# #     allowed_headers = ["*"]
# #     allowed_methods = ["PUT", "POST"]
# #     allowed_origins = ["https://s3-website-test.hashicorp.com"]
# #     expose_headers  = ["ETag"]
# #     max_age_seconds = 3000
# #   }

#   cors_rule {
#     allowed_methods = ["GET"]
#     allowed_origins = ["*"]
#   }
# }