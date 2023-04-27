

module "dragondrop-compute" {
  source  = "dragondrop-cloud/dragondrop-compute/aws"
  version = "~>0.0"

  https_trigger_lambda_name = "${var.naming_prefix}-dragon-drop-https-trigger"
  region                    = var.aws_region
  service_account_name      = "${var.naming_prefix}-dragon-drop-service-account"
}

