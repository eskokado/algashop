# Algashop

Monorepo do projeto **Algashop**, composto por microserviços independentes versionados como submodules Git.

## Microserviços

| Serviço | Repositório | Porta | Descrição |
|---------|-------------|-------|-----------|
| [ordering](microservices/ordering) | [ordering](https://github.com/eskokado/ordering) | `8080` | Pedidos, carrinho, checkout e clientes |
| [billing](microservices/billing) | [billing](https://github.com/eskokado/billing) | `8082` | Faturamento e processamento de pagamentos |

Cada microserviço possui ciclo de vida, build e testes próprios. Consulte o README de cada um para detalhes.

## Pré-requisitos

- **Java 21**
- **Gradle** (wrapper incluso em cada microserviço)
- **Docker** (necessário para integração de frete no `ordering`)
- **Python 3** (opcional, para o script de cobertura)

## Primeiro setup

```bash
git clone git@github.com:eskokado/algashop.git
cd algashop
git submodule update --init --recursive
```

Se o repositório já estiver clonado:

```bash
git submodule update --init --recursive
```

## Infraestrutura local

O serviço `ordering` depende de um stub da API Rapidex (WireMock):

```bash
docker compose up -d rapidexapi
```

O mock fica disponível em `http://localhost:8780`.

## Cobertura de testes

O script `check_coverage.py` executa testes e valida cobertura JaCoCo (100%) nos microserviços:

```bash
# todos os serviços
python check_coverage.py

# serviço específico
python check_coverage.py billing
python check_coverage.py ordering
```

Para o `ordering`, o script sobe o WireMock automaticamente quando necessário.

## Estrutura do repositório

```
algashop/
├── check_coverage.py          # runner de testes e cobertura
├── docker-compose.yml         # WireMock (Rapidex)
├── etc/wiremock/              # mappings do stub
└── microservices/
    ├── billing/               # submodule
    └── ordering/              # submodule
```

## Desenvolvimento

Trabalhe dentro do submodule desejado e faça commit/push no repositório correspondente. Depois, atualize a referência do submodule no monorepo:

```bash
cd microservices/billing
# ... alterações e commit ...
cd ../..
git add microservices/billing
git commit -m "chore: update billing submodule"
```
