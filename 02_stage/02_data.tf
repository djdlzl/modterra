module "stage" {
  source = "../01_module"

  region     = "ap-northeast-1"
  cidr       = "0.0.0.0/0"
  cidr_main  = "192.168.0.0/16"
  name       = "jwcho"
  avazone    = ["a", "b"]
  key        = "tf-key1"
  public_s   = ["192.168.0.0/24", "192.168.2.0/24"]
  private_s  = ["192.168.1.0/24", "192.168.3.0/24"]
  db_s       = ["192.168.4.0/24", "192.168.5.0/24"]
  private_ip = "192.168.0.11"

}
