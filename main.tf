module "bucket" {
  source = "./module/bucket"
}

module "server" {
  source = "./module/instance"
}