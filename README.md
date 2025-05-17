# Terraform (AWS)
## _Exemplo de criação de ec2 no AWS utilizando Terraform_


> Código simples para exemplificar
> como criar uma instancia ec2 na AWS.


## Installation

Baixe o codigo e execute localmente. Lembre que você precisa ter o Terraform instalado e as credenciais de acesso à AWS precisam ser declaradas via comando export.

```sh
terraform init
```

Gerando plano

```sh
terraform plan -out plan.out
```

Provisionando na AWS

```sh
terraform apply plan.out
```

Leia a saída do comando e confirme (ou não) o provisionamento.


## License

MIT
