# Exercício 3.1 — Terraform: endurecer a segurança de rede da VM

Pré-requisito — chave SSH no Cloud Shell
A VM usa autenticação somente por chave SSH. Garanta que o Cloud Shell tem um par de chaves:

# Cria ~/.ssh/id_rsa e id_rsa.pub se ainda não existirem (não sobrescreve)
```bash
test -f ~/.ssh/id_rsa.pub || ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
``` 

# Clonar o repositório (apenas na primeira vez)
## Estou efetuando o clone a partir do meu repositório pois nele eu substituí um atributo deprecated

- enable_accelerated_networking (esse atributo está deprecated)
- accelerated_networking_enabled (esse é o novo atributo)


```bash
git clone -b main https://github.com/gustavo-veloso/aie-cloud.git 
``` 

# Dando permissão de execucao nos scripts
```bash
cd ~/aie-cloud/aulas/01-fundamentos-iac/lab/scripts
chmod +x exercicio-3-1-1-deploy-terraform.sh
``` 

# Execute o script de deploy do terraform (Passo 1)
```bash
./exercicio-3-1-1-deploy-terraform.sh
``` 

# Atualizar os arquivos main.tf, outputs.tf e variables.tf com as modificações realizadas para endurecer a segurança de rede da VM
## Eu criei um novo branch no git para essa nova versão.

Vamos precisar baixar essa nova versão dos arquivos a partir desse novo branch (atualizacao-para-endurecer-seguranca)

```bash
git fetch origin
git checkout atualizacao-para-endurecer-seguranca
``` 

# Dando permissão de execucao nos scripts
```bash
cd ~/aie-cloud/aulas/01-fundamentos-iac/lab/scripts
chmod +x exercicio-3-1-2-deploy-terraform-upgraded.sh
chmod +x exercicio-3-1-3-destroy-terraform.sh
``` 

# Execute o script de deploy do terraform upgraded (Passo 2)
```bash
./exercicio-3-1-2-deploy-terraform-upgraded.sh
``` 

# Execute o script de destruicao do servidor uma vez que você já não precisa mais dele (importante destruir o servidor no final para não ficar com ele em execução e pagando por recurso que você não vai usar) (Passo 3)
```bash
./exercicio-3-1-3-destroy-terraform.sh
``` 

----


# Exercício 3.2 — Bicep equivalente

## Caso você ainda não tenha baixado os arquivos do repositorio, utilize o comando abaixo, caso contrário vá para o possimo passo.
```bash
git clone -b main https://github.com/gustavo-veloso/aie-cloud.git 
``` 

# Dando permissão de execucao nos scripts
```bash
cd ~/aie-cloud/aulas/01-fundamentos-iac/lab/scripts
chmod +x exercicio-3-2-deploy-bicep.sh
``` 

# Use o comand abaixo para verificar se a chave SSH pública existe...
```bash
ls ~/.ssh/id_rsa.pub
``` 

# Caso não exista, Use o comand abaixo criaar a chave SSH pública...
```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
``` 

# Execute o script de deploy do Bicep 
```bash
./exercicio-3-2-deploy-bicep.sh
``` 

# Execute o comando para a destruição da VM 
```bash
az group delete \
  --name rg-bicep-aula01 \
  --yes \
  --no-wait
``` 

### Quantidade de linhas

| Artefato | Arquivo | Quantidade de linhas |
|---|---:|---:|
| ARM Template | `template.json` | 245 |
| Terraform | `main.tf` | 159 |
| Bicep | `main.bicep` | 189 |

### Qual ficou mais legível?

O arquivo `main.bicep` ficou mais legível do que o `template.json`, pois possui uma sintaxe mais enxuta, declarativa e nativa para Azure. Em comparação ao ARM Template, o Bicep reduz bastante a verbosidade e facilita a leitura da estrutura dos recursos.

Em relação ao Terraform, ambos são legíveis, mas com propósitos diferentes. O Terraform tem uma sintaxe clara e é muito forte para ambientes multi-cloud. Já o Bicep parece mais direto quando o escopo é exclusivamente Azure, pois os tipos de recursos, propriedades e integração com Azure Resource Manager são nativos.

### Em que cenário eu escolheria Bicep sobre Terraform?

Eu escolheria Bicep quando o ambiente fosse exclusivamente Azure e a organização quisesse uma solução IaC nativa, integrada ao Azure Resource Manager, Azure CLI e ao ecossistema Microsoft. Bicep é especialmente adequado quando o time já trabalha com Azure, não precisa provisionar recursos em múltiplas nuvens e deseja uma alternativa mais simples e legível do que ARM Templates JSON.

Eu escolheria Terraform quando o cenário exigisse multi-cloud, padronização entre diferentes provedores como Azure, AWS e GCP, ou quando a organização já utilizasse Terraform como padrão corporativo de IaC.
