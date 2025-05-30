variable "region" {
  description = "Define qual a região onde a instancia sera criada"
  default     = "sa-east-1"
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

variable "ssh_user" {
  description = "Usuario criado na Instancia ec2"
  default     = "ubuntu"
}

variable "key_name" {
  description = "Nome da chave SSH criada na AWS"
  default     = "chaves-aws"
}

variable "private_key" {
  description = "Nome da parte privada da chave SSH criada na AWS"
  default     = "aws-key"
}

variable "public_key" {
  description = "Nome da parte publica da chave SSH criada na AWS"
  default     = "aws-key.pub"
}

variable "private_key_path" {
  description = "Caminho local onde será armazenada e buscada a chave privada"
  default     = "certs"
}

variable "ports" {
  description = "Portas Ingress"
  type = map(object({
    description = string
    cidr_blocks = list(string)
  }))
  default = {
    22 = {
      description = "Porta 22"
      cidr_blocks = ["0.0.0.0/0"]
    }
    80 = {
      description = "Porta 80"
      cidr_blocks = ["0.0.0.0/0"]
    }
    443 = {
      description = "Porta 443"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}