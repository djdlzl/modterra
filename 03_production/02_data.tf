module "production" {
  source = "../01_module"

  region        = "ap-northeast-2"
  cidr_internet = "0.0.0.0/0"
  cidr_main     = "10.0.0.0/16"
  name          = "jwcho"
  avazone       = ["a", "b"]
  key           = "tf-key1"
  public_s      = ["10.0.0.0/24", "10.0.2.0/24"]
  private_s     = ["10.0.1.0/24", "10.0.3.0/24"]
  db_s          = ["10.0.4.0/24", "10.0.5.0/24"]
  private_ip    = "10.0.0.11"
  prot_http     = "80"
  prot_ssh      = "22"
  prot_mysql    = "3306"
  prot_icmp     = "-1"
  instance_type = "t2.micro"

}

