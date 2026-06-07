#!/bin/bash

echo "Compilando o template Bicep para verificar se há erros de sintaxe..."
az bicep build --file ../aula01-bicep/main.bicep

echo "Iniciando execução do script de deploy do Bicep..."
az group create --name rg-bicep-aula01 --location eastus2

echo "Obtendo o IP público da máquina que terá acesso ao servidor por SSH..."
MEU_IP=$(curl -s ifconfig.me)

echo "Iniciando o deploy do Bicep... O processo pode levar alguns minutos. Aguarde a conclusão."
az deployment group create \
  --resource-group rg-bicep-aula01 \
  --template-file ../Bicep/main.bicep \
  --parameters adminPublicKey="$(cat ~/.ssh/id_rsa.pub)" meuIp="$MEU_IP"

echo "Script de deploy do Bicep concluído! O IP público do servidor é:"
az deployment group show \
  --resource-group rg-bicep-aula01 \
  --name main \
  --query properties.outputs.public_ip_address.value \
  -o tsv

  