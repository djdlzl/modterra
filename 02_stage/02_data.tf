module "stage" {
  source = "../01_module"

  region        = "ap-northeast-3"
  cidr_internet = "0.0.0.0/0"
  cidr_main     = "192.168.0.0/16"
  name          = "jwcho"
  avazone       = ["a", "c"]
  key           = "tf-key1"
  public_s      = ["192.168.0.0/24", "192.168.2.0/24"]
  private_s     = ["192.168.1.0/24", "192.168.3.0/24"]
  db_s          = ["192.168.4.0/24", "192.168.5.0/24"]
  private_ip    = "192.168.0.11"
  port_http     = "80"
  port_ssh      = "22"
  port_mysql    = "3306"
  port_icmp     = "-1"
  instance_type = "t2.micro"
  db_instance_type = "db.t2.micro"

}
