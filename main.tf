provider "aws" {
  region     = "us-east-1"
}

module "our_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "our-sunday-single-instance"

  instance_type          = "t2.micro"
  key_name               = "3tier"
  monitoring             = true
  vpc_security_group_ids = ["sg-0fe77998f5ef437d8"]
  subnet_id              = "subnet-0ba15e533f468923a"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
