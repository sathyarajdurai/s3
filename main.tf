resource "aws_s3_bucket" "test_bucket_all" {
    bucket = "s3-test-bucket-demo-sathya"

    tags = {
        Name = "s3-test-bucket"
        Environment = "test"
    }

    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = "s3-test-bucket-demo-sathya"
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "server_test_encryption" {
  bucket = "s3-test-bucket-demo-sathya"
    rule {
      apply_server_side_encryption_by_default {
        # kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "AES256"
      }
    }
  }



resource "aws_s3_bucket_public_access_block" "test_bucket_all" {
  bucket = "s3-test-bucket-demo-sathya"
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "version_my_bucket" {
    bucket = "s3-test-bucket-demo-sathya"
    
    versioning_configuration {
      status = "Enabled"
    }
  
}

resource "aws_s3_bucket_policy" "allow_access_to_public" {
  bucket = "s3-test-bucket-demo-sathya"
  
  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Id": "MYBUCKETPOLICY",
    "Statement": [
      {
        "Sid": "",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:*",
        "Resource": "*"
      }
    ]
  }
  POLICY
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