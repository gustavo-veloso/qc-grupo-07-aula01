#!/bin/bash

echo "Iniciando execução do script de destruição do Terraform..."

cd ~/aie-cloud/aulas/01-fundamentos-iac/lab/terraform

# Destruir TUDO ao final (regra de ouro — custo zero)
terraform destroy -var="meu_ip=$MEU_IP"

echo "Script de destruição do Terraform concluído!"