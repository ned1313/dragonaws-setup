provider "aws" {
  region = var.aws_region
}

module "dragondrop-compute" {
  source  = "dragondrop-cloud/dragondrop-compute/aws"
  version = "~>0.0"

  https_trigger_lambda_name = "${var.naming_prefix}-dragon-drop-https-trigger"
  region                    = var.aws_region
  service_account_name      = "${var.naming_prefix}-dragon-drop-service-account"
}

# Create an S3 bucket for migration history
resource "aws_s3_bucket" "migration_history" {
  bucket = "${var.naming_prefix}-migration-history"
  acl   = "private"
}

# Grant service account access to S3 bucket
resource "aws_iam_role_policy" "main" {
    name = "${var.naming_prefix}-migration-history"
    role = "dragondrop-fargate-runner"

    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.migration_history.bucket}",
                "arn:aws:s3:::${aws_s3_bucket.migration_history.bucket}/*"
            ]
    }
  ]
}
EOF
}
