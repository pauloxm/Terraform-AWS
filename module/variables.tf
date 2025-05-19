variable "region" {
  description = "Define qual a região onde a instancia sera criada"
  default     = "us-east-1"
}

variable "name" {
  description = "Nome da aplicação"
  default     = "terraform-instance"
}

variable "env" {
  description = "Ambiente da aplicação"
  default     = "dev"
}

variable "instance_type" {
  description = "Configuração de hardware da máquina"
  default     = "t2.micro"
}

variable "repo" {
  description = "Repositorio da aplicação"
  default     = "https://github.com/pauloxm/Terraform-AWS"
}

#################################################################################################

variable "ssh_user" {
  default = "ubuntu"
}
variable "private_key" {
  default = "aws-key"
}

variable "public_key" {
  default = "aws-key.pub"
}

variable "private_key_path" {
  default = "/home/pauloxmachado/Git/Terraform/Terraform-AWS/certs"
}

#################################################################################################