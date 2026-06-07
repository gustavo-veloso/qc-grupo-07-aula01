#!/bin/bash

echo "Iniciando execução do script de deploy do Terraform..."

echo "Obtendo o IP público da máquina e guardando na minha variável MEU_IP..."
MEU_IP=$(curl -s ifconfig.me)

echo $MEU_IP

cd ~/aie-cloud/aulas/01-fundamentos-iac/lab/terraform

# Inicializar providers
echo "Inicializando Terraform..."
terraform init

# Ver o que será criado
echo "Verificando o que será criado..."
terraform plan -var="meu_ip=$MEU_IP"

# Aplicar (digite 'yes' quando perguntar)
echo "Aplicando Terraform... Digite 'yes' quando for solicitado para confirmar a aplicação."
terraform apply -var="meu_ip=$MEU_IP"

echo "Script de deploy do Terraform concluído!"