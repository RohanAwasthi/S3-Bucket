provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-terraform-bucket"  # Replace with your desired bucket name
  acl    = "private"  # You can set the ACL (Access Control List) to "private," "public-read," etc.

  # Optional: Enable versioning for the bucket
  versioning {
    enabled = true
  }

  # Optional: Configure server-side encryption for the bucket
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Optional: Add tags to the bucket
  tags = {
    Name = "ExampleBucket"
    Environment = "Development"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example_bucket.id
}
