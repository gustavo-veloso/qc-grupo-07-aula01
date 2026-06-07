#!/bin/bash

echo "Iniciando execução do script de destruição do Terraform..."

cd ~/qc-grupo-07-aula01/terraform

# Destruir TUDO ao final (regra de ouro — custo zero)
terraform destroy -var="meu_ip=$MEU_IP"

echo "Script de destruição do Terraform concluído!"