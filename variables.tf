variable "region" {
  description = "Define qual a região onde a instancia sera lançada"
  default     = "us-east-1"
}

variable "name" {
  description = "Nome da aplicação"
  default     = "server01"
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