module "our_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "our-sunday-single-instance"

  instance_type          = "t2.micro"
  key_name               = "sunday-keypair"
  monitoring             = true
  vpc_security_group_ids = ["sg-04d73380e2b0793bd"]
  subnet_id              = "subnet-0027c55b8c8c2ebdc"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
