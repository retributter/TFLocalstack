module "provider" {
  source = "./modules/provider"

  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  aws_region     = var.aws_region
}

module "s3" {
  source = "./modules/s3"
}

module "policies" {
  source        = "./modules/policies"
  s3_bucket_arn = module.s3.s3_bucket_arn
}

module "ec2" {
  source     = "./modules/ec2"
  policy_arn = module.policies.policy_arn
}

output "s3_bucket_id" {
  value = module.s3.bucket_id
}

output "iam_role_id" {
  value = module.ec2.role_id
}