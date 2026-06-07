# Entrega Aula 01 — Grupo 07

**Disciplina:** Cloud & Cognitive Environments — FIAP MBA AI Engineering & Multi-Agents
**Turma:** 1AIER
**Data de entrega:** 07/06/2026

## Grupo

| # | Nome completo | GitHub | E-mail FIAP |
|---|---------------|--------|-------------|
| 1 | Diego Donario Ricco| DiegoRicco | rm374019@fiap.com.br |
| 2 | Diogo Alves Veiga| DiogoVeigaDV | rm375392@fiap.com.br |
| 3 | Gustavo de Mendonça Veloso | gustavo-veloso | rm371011@fiap.com.br |
| 4 | Marcio Morelli Soares| MarcioMorelli | rm371246@‌fiap.com.br |

## Distribuição do trabalho

| Membro | Nível assumido | Item específico |
|--------|----------------|-----------------|
| Diego Ricco | 🟢 N1 | Exercício 1.1, 1.2 e 1.3 |
| Diogo Veiga e Marcio Soares | 🟢 N1 | Exercício 1.4 |
| Marcio Soares | 🟡 N2 | Exercício 2.1 |
| Diogo Veiga | 🟡 N2 | Exercício 2.2 |
| Diego Ricco | 🟡 N2 | Exercício 2.3 |
| Gustavo Veloso| 🔴 N3 (bônus) | Exercício 3.1, 3.2 e 3.3 — IaC avançado |
| Diego Ricco, Diogo Veiga, Gustavo Veloso e Marcio Soares  | 🟢 N1 (apoio) | Revisão das respostas N1 |

> Regra: cada membro deve ter pelo menos uma contribuição. O **rodízio entre aulas** (quem fez N1 antes faz N2 depois) é incentivado e vale o ponto do Critério 4 (ver [rubrica.md](rubrica.md)).

---

## 🟢 Nível 1 — Respostas

**Exercício 1.1 — Mapeamento de modelos de serviço**
**Para cada serviço, identifique se é IaaS, PaaS, SaaS ou FaaS. Justifique em uma frase.**

| Serviço | Modelo (IaaS/PaaS/SaaS/FaaS) | Justificativa |
|---------|------------------------------|---------------|
| Gmail | SaaS | É um aplicativo pronto de e-mail na nuvem. O usuário só consome a aplicação, o provedor faz o gerenciamento (infra, SO, runtime, app). |
| Azure Virtual Machines | IaaS | Entrega infraestrutura virtualizada (VM, rede, disco). Você gerencia o sistema operacional, runtime, aplicação e dados. |
| Azure App Service (hospedar uma API) | PaaS | Serviço de plataforma para hospedar aplicações. A Microsoft gerencia o SO e runtime, você só sobe o código e gerencia a app/dados. |
| AWS Lambda | FaaS | Modelo serverless baseado em funções. Você sobe apenas a função (código) e paga por execução, não gerencia servidor nem SO. |
| Azure SQL Database | PaaS | Banco relacional gerenciado. O provedor cuida de SO, runtime e engine de banco e você só gerencia os dados, esquemas, usuários, etc. |
| Salesforce CRM | SaaS | Aplicação de CRM pronta. Usuário só configura e usa o sistema. Toda a infraestrutura e plataforma são gerenciadas pelo Salesforce. |
| Google Kubernetes Engine (GKE) | PaaS | Plataforma gerenciada de orquestração de containers. O Google gerencia o control plane e infraestrutura e você gerencia clusters, pods e apps. |
| Azure Blob Storage | PaaS | Serviço de armazenamento de objetos como plataforma. Infra e SO são abstraídos e você só lida com containers, blobs e políticas de acesso. |
| Azure OpenAI Service | PaaS | Serviço de plataforma de IA (API de modelos). A Microsoft gerencia a infra e os modelos; você consome via API, integrando na sua app. |
---
**Exercício 1.2 — Os 6 Rs na prática**
**Leia cada cenário e escolha o R de migração mais adequado (Rehost, Replatform, Refactor, Repurchase, Retire, Retain). Justifique.**

Cenário A: Empresa de logística tem sistema de rastreamento de frotas em servidor físico próprio. Código de 2008, sem documentação, só uma pessoa sabe mexer. Quer migrar rápido para ganhar elasticidade.

**Resposta:** Rehost (Lift & Shift) - O sistema é antigo, pouco documentado e depende fortemente do conhecimento de uma única pessoa.
Há urgência em migrar, então não há tempo viável para refatorar ou redesenhar.


Cenário B: Banco regional usa ERP local de RH. Análise mostra: menos de 5 usuários ativos por mês, dados raramente consultados.

**Resposta:** Retire - O uso é baixíssimo e poucos usuários e dados raramente acessados.
O custo de manter (infra, suporte, migração) tende a ser maior que o valor que o sistema gera.


Cenário C: Fintech tem API de pagamentos monolítica. Decide aproveitar a migração para refatorar em microserviços com K8s e event-driven.

**Resposta:** Refactor - A empresa quer explicitamente reescrever a aplicação em um modelo cloud-native (microserviços, event-driven, Kubernetes).
Isso é refatorar a arquitetura para aproveitar ao máximo os recursos da nuvem (escalabilidade, resiliência, desacoplamento).


Cenário D: Varejo usa CRM desenvolvido internamente há 15 anos. SaaS de mercado atenderia 90% das necessidades por menor custo.

**Resposta:** Repurchase - Em vez de manter um sistema próprio antigo, a empresa pode substituí-lo por um produto SaaS
Se um SaaS cobre ~90% das necessidades por menor custo, a troca compensa fortemente.


Cenário E: Instituição financeira tem mainframe com dados de clientes que precisa ficar on-premise por exigência do Banco Central.

**Resposta:** Retain - Há uma exigência regulatória explícita para manter os dados on-premise e migrar para cloud poderia violar compliance.

---

Exercício 1.3 — Calculando o impacto do SLA
Sistema de e-commerce com SLA de 99,9%.

a) Quantas horas de downtime por ano? b) Se processa R$ 50.000/hora em vendas, qual o impacto financeiro máximo por ano? c) Para reduzir o impacto para menos de R$ 50.000/ano, qual SLA mínimo seria necessário?

**Resposta:**
a) - 8,76 horas por ano.
b) - R$ 438.000 por ano.
c) - SLA mínimo ≈ 99,99% para ter impacto anual abaixo de R$ 50.000.

---

### Exercício 1.4 — RBAC na prática

Você é o responsável de segurança da Quantum Commerce. Para cada perfil abaixo, escolha a role built-in do Azure mais adequada e justifique:

| Perfil | Role Azure mais adequada | Justificativa |
|--------|--------------------------|---------------|
| Agente de IA que LÊ produtos do Storage para responder ao cliente | Storage Blob Data Reader | É a role mínima necessária para ler e listar blobs do catálogo. Segue o princípio de Least Privilege, impedindo gravação ou alteração de dados. É mais adequada que Reader, pois permite acesso ao conteúdo dos blobs e não apenas aos metadados do recurso |
| Engenheiro de dados que CARREGA novos catálogos no Blob | Storage Blob Data Contributor | Permite leitura, gravação e atualização dos arquivos do catálogo sem conceder permissões administrativas sobre a infraestrutura. É a built-in role mais adequada para ingestão de dados. Caso a operação não permita exclusão de arquivos, uma Custom Role seria ainda mais aderente ao Least Privilege. |
| Time de FinOps que precisa VER custos sem alterar recursos | Cost Management Reader | Permite visualizar custos, consumo e análises financeiras da assinatura sem qualquer permissão de alteração de recursos ou configurações. |
| Auditor externo que precisa LER configurações de toda a assinatura | Reader| Fornece acesso somente leitura a todos os recursos da assinatura, permitindo auditoria completa sem risco de criação, alteração ou exclusão de recursos. |
| Sistema de CI/CD que provisiona infraestrutura via Terraform |Contributor | Permite criar, modificar e remover recursos necessários para o provisionamento automatizado da infraestrutura. Não permite gerenciar permissões RBAC, reduzindo riscos de escalonamento indevido de privilégios. A atribuição deve ser feita no menor escopo possível (Least Privilege), preferencialmente no Resource Group do projeto. |

**Referência:** [Azure Built-in Roles](https://learn.microsoft.com/azure/role-based-access-control/built-in-roles)

---

## 🟡 Nível 2 — Intermediário: Análise e Estratégia

### Exercício 2.1 — Arquitetura de alto nível: Quantum Commerce

**Contexto:** A Quantum Commerce é um gigante do e-commerce com 12 países, 5M de SKUs, e quer transformar a experiência de compra com IA conversacional.

**Sua tarefa (em grupo):** Proponha uma arquitetura de alto nível em cloud para a QC. Identifique:

1. **Camadas da arquitetura** — quantas e o que cada uma faz (ex: frontend, API, dados, AI/ML, observabilidade)

| Camada | O que faz |
|-----------|--------------|
| Frontend | Web/app do e-commerce, portal de atendimento, dashboards internos |
| API/ Integração | Expõe serviços de produto, pedido, cliente, estoque, recomendação e atendimento |
| Compute/ Backend | Executa microsserviços, regras de negócio, scoring de produtos e workflows |
| Dados Transacionais | Guarda pedidos, clientes, pagamentos, estoque e operações críticas |
| Dados Analíticos | Centraliza eventos, histórico de vendas, navegação, logística e atendimento |
| AI/ ML/ GenAI | Modelos de classificação, previsão de ruptura, recomendação, chatbot e busca semântica |
| Mensageria | Desacopla eventos de pedido, estoque, preço, catálogo e logística |
| Segurança | IAM, secrets, RBAC, least privilege e auditoria |
| Observabilidade (logs/métricas) | Logs, métricas, tracing, alertas, custo, performance e saúde dos modelos |

2. **Provedor principal** — qual escolheria (Azure, AWS, GCP) e por quê.

A recomendação é adotar a Azure como provedor principal da Quantum Commerce, por oferecer, aparentemente o melhor equilíbrio entre IA generativa, agentes, dados, segurança, identidade corporativa e governança. AWS e GCP são alternativas tecnicamente fortes.

A GCP não seria a escolha principal porque tradicionalmente sua maior força está em dados, analytics e machine learning. O desafio da Quantum exige mais do que analytics: exige execução operacional segura, integração com sistemas transacionais, agentes com permissões controladas, rastreabilidade e governança corporativa. Por isso, GCP ficaria como alternativa complementar, mas não como provedor principal.

A AWS não seria a escolha principal porque, embora tenha grande maturidade, escala global e um catálogo muito amplo de serviços, sua implementação pode exigir maior esforço de integração entre os componentes de IA generativa, identidade, governança, dados e execução operacional. 

3. **Serviços por categoria** — preencha a tabela:

| Categoria | Serviço Azure | Alternativa AWS | Alternativa GCP |
|-----------|--------------|-----------------|-----------------|
| Compute (backend) | Virtual Machines | EC2 | Compute Engine |
| Storage (catálogo, imagens) | Blob Storage | S3 | Cloud Storage |
| Banco relacional | Azure SQL | RDS/Aurora | Cloud SQL |
| Banco NoSQL | Cosmos DB | Dynamo DB  | Firestore |
| Vector Database | Azure AI Search com vector search |Amazon Bedrock Knowledge Bases + S3 Vectors | Gemini Enterprise Agent Platform Vector Search |
| Serviços de IA cognitivos | Azure AI Services | Bedrock + SageMaker | Vertex AI |
| CDN | Azure Front Door | Amazon CloudFront | Cloud CDN |
| Mensageria/Filas | Azure Service Bus Queues | Amazon SQS | Cloud Tasks |
| Observabilidade (logs/métricas) | Azure Monitor + Log Analytics + Application Insights | Amazon CloudWatch + AWS X-Ray + CloudTrail | Google Cloud Observability |

4. **Diagrama** — feito no Excalidraw (excalidraw.com), draw.io (diagrams.net) ou à mão fotografado. **Tudo sem instalação.**

> **Entrega:** O grupo commita o esboço (`respostas-aula01.md` + imagem do diagrama) no fork até 1 dia antes da Aula 2. O professor dá feedback escrito durante a semana. O diagrama evolui a cada aula até a entrega final na Aula 6.

---

### Exercício 2.2 — Comparativo de custos: 3 provedores.

Você precisa recomendar infraestrutura para um projeto de AI Engineering. Use as calculadoras para comparar:

- 2 VMs com 2 vCPUs e 8 GB RAM (Linux, 24/7)
- 500 GB de object storage
- 1 banco gerenciado com 2 vCPUs / 8 GB RAM / 100 GB
- 10 milhões de requisições/mês para função serverless

| Item | Azure (pagto mensal) | AWS | GCP | Notas |
|------|-------|-----|-----|-------|
| 2 × VM (2vCPU/8GB) | USD 140,16 | USD 121,47 | USD 139,30 | Tipo: D2s v5 (Azure) / t3.large (AWS) / E2 Standard-2 (GCP) |
| 500 GB storage | USD 11,44 | USD 11,50 | USD 9,90 | Tipo: Blob Storage Hot LRS / S3 Standard / Cloud Storage Standard |
| Banco gerenciado | USD 383,14 | USD 157,50 | USD 118,18 | Tipo: PostgreSQL Flexible Server / RDS PostgreSQL / Cloud SQL PostgreSQL |
| 10M req serverless | USD 1,80 | USD 1.80 | USD 18,91 | Tipo: Azure Functions Consumption / AWS Lambda / Cloud Run Functions Gen2 |
| **Total mensal** | USD 536,54 | USD 292,27 | USD 286,29  | |
| **Total anual** | USD 6.438,48 | USD 3.507,24  | USD 3.435,48 | |

Cálculo Azure: https://azure.com/e/2aa3fe6cba12443dbe95b4de5f652571 
Cálculo AWS: https://calculator.aws/#/estimate?id=69d0d523841446ff18e92753bcb44b0946671ad2 
Cálculo GCP: https://cloud.google.com/products/calculator?dl=CjhDaVF3WW1OaE9USTNNeTAzTVRBNExUUXlPRFl0WWpRNU5pMHhabVUzWm1ReE1qVm1Nek1RQVE9PRAcGiQ1NkFCMUE3RS02RjlGLTQyODYtQTBDMC02M0RFQTZBNURCOEI 

**Análise:**

a) Qual provedor ficou mais barato? A diferença é significativa?
O provedor mais barato foi o GCP, com custo mensal de USD 286,29, seguido de perto pela AWS com USD 292,27. O Azure ficou significativamente mais caro, com USD 536,54 por mês.
A diferença entre GCP e AWS é pequena, apenas USD 5,98 por mês (≈2%), o que não é relevante para a decisão.
Já o Azure custa cerca de 87% mais que o GCP e 84% mais que a AWS, uma diferença bastante significativa para essa arquitetura.

b) Aplicando Reserved Instances de 1 ano no mais caro, o resultado muda?
Com Reserved Instances de 1 ano, o Azure reduz seu custo mensal de USD 536,54 para USD 404,28, uma economia de aproximadamente 24,7%. Apesar da redução, o Azure continua sendo o provedor mais caro. Portanto, a aplicação de Reserved Instances melhora significativamente o custo do Azure, mas não altera o ranking dos provedores. Detalhes disponíveis na tabela abaixo:

**Aplicando reserved instances de 1 ano**
| Item | Azure | AWS | GCP | Notas |
|------|-------|-----|-----|-------|
| 2 × VM (2vCPU/8GB) | USD 96,13 | USD 43,80 | USD 90,30  | Tipo: D2s v5 (Azure) / t3.large (AWS) / E2 Standard-2 (GCP) |
| 500 GB storage | USD 11,44 | USD 11,50 | USD 9,90 | Tipo: Blob Storage Hot LRS / S3 Standard / Cloud Storage Standard |
| Banco gerenciado | USD 294,91 | USD 157,50 | USD 92,88 | Tipo: PostgreSQL Flexible Server / RDS PostgreSQL / Cloud SQL PostgreSQL |
| 10M req serverless | USD 1,80 | USD 1.80 | USD 15,69 | Tipo: Azure Functions Consumption / AWS Lambda / Cloud Run Functions Gen2 |
| **Total mensal** | USD 404,28 | USD 214,60 | USD 208,77 | |
| **Total anual** | USD 4.851,36 | USD 2.575,20 | USD 2.505,24 | |

Cálculo Azure: https://azure.com/e/6a2dbe7bcae44fd0ba1b7e17fb49b279 
Cálculo AWS: https://calculator.aws/#/estimate?id=69d0d523841446ff18e92753bcb44b0946671ad2 
Cálculo GCP: https://cloud.google.com/products/calculator?dl=CjhDaVJoWmpBNVpqTTFOUzB3WlRSa0xUUmtZbVl0WVRRNU1DMWxaamxrWVdKaE4yVmlNRFVRQVE9PRAJGiRCRkZFRTUwMC1DOEQ0LTQ3QTAtOEY1NS1GMUJCRUE3NENGQzY 

**Observações:** 
1- Na Azure, estranhamente, ao adicionar somente a reserva para 1 ano no Storage, o preço pulou para USD 18,7k! Para não gerar uma distorção baseada em um aparente erro, nesse exercício repeti o valor do preço mensal. 
2- Na AWS, somente o serviço de VM apresentou opção de reserved instance de 1 ano.

c) Além de preço, que outros fatores você consideraria para um projeto de IA?
Além do preço, a escolha de um provedor para um projeto de IA deve considerar fatores como a maturidade dos serviços de IA e machine learning, facilidade de integração com dados, escalabilidade, segurança, governança e conformidade regulatória. Também são importantes a disponibilidade global da infraestrutura, os custos de crescimento futuro, o conhecimento da equipe sobre a plataforma e o risco de dependência excessiva de um único fornecedor (lock-in). Para a Quantum Commerce, esses aspectos podem ser mais relevantes para o sucesso do projeto do que pequenas diferenças de custo entre os provedores.

**Calculadoras:**

- Azure: https://azure.microsoft.com/pricing/calculator
- AWS: https://calculator.aws
- GCP: https://cloud.google.com/products/calculator

---

### Exercício 2.3 — Estratégia de migração para sua empresa

Pense no seu contexto profissional atual (ou empresa que conhece bem).

a) Descreva um sistema/workload (sem dados confidenciais — pode ser genérico)  
Uma fintech tem uma plataforma de conciliação financeira e processamento de transações que:  
Recebe arquivos diários de adquirentes, bancos e gateways.  
Processa e reconcilia com ERP e extratos bancários.  
Gera relatórios de divergências e liquidações.  
Expõe um portal e APIs para times internos e, às vezes, clientes B2B.  
Componentes principais: banco relacional (~1 TB), batch noturno, APIs 24/7, ~10 TB de arquivos.  


b) Qual dos 6 Rs você aplicaria? Justifique custo, risco, ganho, prazo  
Eu aplicaria principalmente Replatform, com um pouco de Rehost.  
Replatform: migrar banco para PaaS gerenciado (Azure SQL/PostgreSQL), arquivos para Blob Storage e batch para serviço gerenciado (Azure Batch/VMs com autoscale).  
Rehost: portal/API podem ser migrados quase como estão para App Service ou VMs e evoluídos depois.  

Justificativa:  
Custo: corta custo de infra on‑prem e operação, mantendo esforço de reescrita moderado.  
Risco: médio, mas controlável com migração faseada e ambiente paralelo.  
Ganho: alta disponibilidade, escalabilidade em picos e menos esforço de administração.  
Prazo: algo como 4–8 meses para migrar o core com segurança.  


c) Que serviço Azure usaria? Estimativa mensal?  
Banco: Azure SQL Database ou Azure Database for PostgreSQL (4 vCPU, 16 GB, ~1 TB, General Purpose).  
Batch: Azure Batch ou VMs com autoscale para a janela noturna.  
Portal/API: Azure App Service (2 instâncias).  
Arquivos: Azure Blob Storage (Hot, ~10 TB).  
APIs externas: Azure API Management.  
Observabilidade: Azure Monitor + Application Insights.  

Estimativa de custo mensal (ordem de grandeza, em reais)  
Banco gerenciado: ~R$ 1.500–2.000  
Batch: ~R$ 400–600  
App Service/API: ~R$ 600–800  
Blob Storage 10 TB: ~R$ 1.200–1.500  
API Management: ~R$ 300–500  
Monitoramento: ~R$ 100–200  
Total: ~R$ 4.100–5.600/mês  


d) Maior obstáculo técnico ou organizacional? Como endereçaria?

Migrar em fases, com ambiente paralelo e cutover bem planejado.  
Montar landing zone com governança, segurança e logging antes de migrar o core.  
Treinar o time em Azure e FinOps.  
Envolver compliance/auditoria, documentando controles e evidências.  


---

## 🔴 Nível 3 — Bônus (se aplicável)

(Respostas + scripts/links)

### Exercícios 3.1 e 3.2 — acessar o README.md com mais informações
[Nível 3 - Exercícios 3.1 e 3.2 README.md](README.md).

### Exercício 3.3 — Desafio de Arquitetura Multi-Cloud para a Quantum Commerce

#### a) Arquitetura Multi-Cloud Proposta

###### Visão Geral

Para atender ao objetivo estratégico da Quantum Commerce de reduzir dependência de um único provedor de nuvem (lock-in) e aumentar sua resiliência operacional, propõe-se uma arquitetura multi-cloud baseada em Microsoft Azure e Amazon Web Services (AWS).

###### Azure (Brazil South)

Workloads alocados:

* Plataforma principal de e-commerce
* APIs voltadas ao cliente
* Customer Data Platform (CDP)
* Serviços de identidade e autenticação
* Governança de Dados e IA
* Serviços de IA Generativa e Azure OpenAI
* Monitoramento e conformidade

**Justificativa:**

A Azure oferece forte integração com ferramentas corporativas, recursos avançados de governança, segurança, identidade e serviços de Inteligência Artificial, sendo adequada para workloads críticos relacionados ao cliente e à governança corporativa.

###### AWS (US-East-1)

Workloads alocados:

* Motor de recomendação de produtos
* Analytics e processamento de dados em larga escala
* Marketplace de parceiros
* Processamento de eventos
* Workloads de Machine Learning de alta escalabilidade

**Justificativa:**

A AWS possui um amplo portfólio de serviços escaláveis para processamento distribuído, analytics e Machine Learning, sendo adequada para workloads intensivos em processamento.

###### Integração Entre as Nuvens

A comunicação entre Azure e AWS ocorre através de APIs seguras, integração por eventos e sincronização seletiva de dados.

A arquitetura busca minimizar transferências desnecessárias entre nuvens, reduzindo latência e custos de egress.

###### Representação Simplificada

```text
Clientes
    │
    ▼
CDN / WAF Global
    │
    ▼
Azure Brazil South
    ├─ E-commerce
    ├─ CDP
    ├─ APIs
    ├─ Governança de IA
    └─ Azure OpenAI
            │
            ▼
Integração por APIs/Eventos
            │
            ▼
AWS US-East-1
    ├─ Analytics
    ├─ Marketplace
    ├─ Recomendações
    └─ Machine Learning
```

---

##### b) Principais Desafios da Arquitetura Multi-Cloud

###### 1. Latência entre nuvens

A comunicação entre workloads distribuídos em diferentes provedores pode aumentar o tempo de resposta das aplicações.

**Mitigações:**

* Utilização de cache.
* Processamento assíncrono.
* Redução de chamadas síncronas entre nuvens.
* Aproximação dos workloads dos usuários finais.

---

###### 2. Gestão Unificada de Identidade

Controlar usuários, aplicações e agentes de IA em múltiplos provedores torna-se mais complexo.

**Mitigações:**

* Single Sign-On (SSO).
* Federação de identidade.
* Integração entre Azure AD e provedores externos.
* Governança de Identidades Não Humanas (NHI).

---

###### 3. Custos de Egress

A transferência de dados entre provedores de nuvem gera custos significativos.

**Mitigações:**

* Minimizar movimentação de dados.
* Replicar apenas informações necessárias.
* Processar dados próximos de onde estão armazenados.
* Utilizar compressão e particionamento.

---

###### 4. Observabilidade

Monitorar aplicações, infraestrutura, agentes de IA e integrações em múltiplas nuvens aumenta a complexidade operacional.

**Mitigações:**

* Centralização de logs.
* Monitoramento unificado.
* Distributed Tracing.
* Dashboards consolidados.

---

##### c) Comparação entre Terraform e Pulumi

| Critério             | Terraform                              | Pulumi                                                      |
| -------------------- | -------------------------------------- | ----------------------------------------------------------- |
| Linguagem            | HCL (HashiCorp Configuration Language) | Python, TypeScript, JavaScript, Go, C#, Java                |
| Modelo               | Declarativo                            | Infraestrutura como código usando linguagens de programação |
| Multi-cloud          | Sim                                    | Sim                                                         |
| Azure                | Sim                                    | Sim                                                         |
| AWS                  | Sim                                    | Sim                                                         |
| GCP                  | Sim                                    | Sim                                                         |
| Curva de aprendizado | Menor                                  | Maior para equipes sem background de desenvolvimento        |
| Legibilidade         | Alta para infraestrutura               | Alta para desenvolvedores                                   |
| Comunidade           | Muito ampla                            | Menor, porém crescente                                      |

###### Quando escolher Terraform

* Ambientes multi-cloud.
* Padronização corporativa.
* Equipes focadas em infraestrutura.
* Grande ecossistema de módulos e provedores.

###### Quando escolher Pulumi

* Equipes com forte perfil de desenvolvimento.
* Necessidade de reutilização de código.
* Uso de lógica complexa.
* Preferência por linguagens tradicionais de programação.

---

##### d) Estimativa de Custos de Egress

###### Cenário

Transferência de dados entre:

* Azure Brazil South
* AWS US-East-1

Volume:

```text
10 TB por mês
```

Conversão:

```text
10 TB = 10.240 GB
```

Considerando um custo aproximado de saída de dados da Azure de:

```text
US$ 0,16 por GB
```

Cálculo:

```text
10.240 × 0,16
```

Resultado:

```text
US$ 1.638,40 por mês
```

###### Conclusão

A movimentação frequente de grandes volumes de dados entre nuvens pode representar um custo significativo. Portanto, a arquitetura deve minimizar transferências desnecessárias e priorizar processamento local sempre que possível.

---

## Azure Arc e AWS Outposts

### Azure Arc

O Azure Arc permite gerenciar recursos distribuídos em Azure, AWS, Google Cloud e ambientes on-premises a partir de uma camada unificada de governança.

Aplicação na Quantum Commerce:

* Governança centralizada.
* Inventário unificado.
* Políticas corporativas consistentes.
* Gestão de servidores e clusters distribuídos.

### AWS Outposts

O AWS Outposts leva serviços AWS para dentro do datacenter da organização.

Aplicação na Quantum Commerce:

* Processamento local em centros logísticos.
* Menor latência operacional.
* Integração direta com serviços AWS.
* Atendimento a requisitos regulatórios ou operacionais específicos.

---

## Conclusão

A adoção de uma arquitetura multi-cloud permite à Quantum Commerce reduzir riscos de dependência tecnológica, aumentar resiliência operacional e selecionar o provedor mais adequado para cada workload. Entretanto, essa estratégia também introduz desafios relacionados à latência, identidade, observabilidade e custos de transferência de dados, exigindo uma governança robusta para garantir eficiência operacional e sustentabilidade financeira.

---

## Reflexão coletiva

3-5 parágrafos respondendo:

1. O que o grupo aprendeu de mais importante nesta aula?
   
   Cloud não é apenas uma questão de armazenamento de dados "em nuvem". Estabelecer um projeto de arquitetura de sistemas em cloud está longe de ser uma tarefa trivial e envolve decisões sobre modelo de serviços, segurança, custo, escabilidade etc. Escolher corretamente o modelo mais adequado de serviços, seja ele, IaaS, PaaS, SaaS ou FaaS impactam diretamente a complexidade de gerenciamento bem como os custos envolvidos. Outro ponto fundamental apresentado em aula está relacionado a forma de criação de recursos em ambiente cloud. Criar recursos manualmente pelo portal web torna-se praticamente impossivel para projetos profissionais e o domínio de IAC (Infra as Code) é conhecimento base para qualquer profissional que pretende atuar nesta área.

2. Como isso se conecta com a arquitetura cloud de uma plataforma agentic?
   
    Agentes de IA precisam operar em uma estrutura de cloud corretamente dimensionada de modo a garantir que estes possam acessar de forma segura os dados corporativos necessários, executar ações e respeitar limites de segurança. E isto somente é viável com o correto dimensionamento do modelo de serviço a ser adotado bem como as camadas de arquitetura e serviços a serem implementadas.


4. Que decisão arquitetural vocês fariam diferente se começassem o projeto QC hoje?
   
    Inciaríamos com um projeto de arquitetura robusto, baseado em cloud, desde o início das operações. 

---

## Artefatos do ZIP

- Diagrama: `diagramas/arquitetura-qc-aula01.png`
- Código IaC - Terraform: `terraform/` 
- Código IaC - Bicep: `aula-01-bicep/`
- Scripts: `scripts/`
- Endpoint ativo (se houver): URL pública sem credenciais — apenas para demonstração durante a janela de correção