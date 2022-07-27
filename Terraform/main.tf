provider "aws" {
  region = "eu-west-3"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "my-vpc"
  cidr = var.vpc_cidr_block
  azs             = [var.avail_zone]
  public_subnets  = [var.subnet_cidr_block]
  public_subnet_tags = { Name: "${var.env_pref}-subnet" }
  tags = {
    Name: "${var.env_pref}-vpc"
  }
}

module "myapp-server" {
  source = "./modules/webserver"
  avail_zone          = var.avail_zone
  env_pref            = var.env_pref
  image_name          = var.image_name
  instance_type       = var.instance_type
  my_ip               = var.my_ip
  public_key_location = var.public_key_location
  subnet_id           = module.vpc.public_subnets[0]
  vpc_id              = module.vpc.vpc_id
}