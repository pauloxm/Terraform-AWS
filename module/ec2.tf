data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]

  }

  owners = ["099720109477"]

}

resource "aws_key_pair" "key-pair" {
  key_name   = var.private_key
  public_key = file("${var.private_key_path}/${var.public_key}")
}

resource "aws_instance" "server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.key-pair.key_name
  subnet_id                   = aws_subnet.minha-subnet.id
  vpc_security_group_ids      = [aws_security_group.minha-security_group.id]
  associate_public_ip_address = true

  tags = {
    Name        = var.name
    Environment = var.env
    Provisioner = "Terraform"
    Repo        = var.repo
  }
}

###################################################################################################################################
#################################################### NULL RESOURCE FOR ANSIBLE ####################################################
###################################################################################################################################

resource "null_resource" "connect_ansible_hosts" {
  connection {
    type        = "ssh"
    user        = var.ssh_user
    private_key = file("${var.private_key_path}/${var.private_key}")
    host        = aws_instance.server.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "echo 'SSH disponível para conexão remota...'"
    ]
  }
  #Execute the ansible command form local system
  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.server.public_ip}, --private-key ${var.private_key_path}/${var.private_key} playbook.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
  }
}
###################################################################################################################################