# Projeto simples em HTTParty

Projeto criado com a intenção de guardar uma arquitetura simplificada de httparty

### Prerequisites

Independente do OS utilizado

```
Ruby 2.7.1
Gems httparty, rspec e faker
```

### Installing
Clone o repositório na sua máquina

```
git clone https://github.com/marlonrochaeng/apiHttpartyTest.git
```

Instale a versão 2.7.1 do Ruby e execute no terminal:

```
gem install bundle
```

Após a gem bundle instalada, navegue até a pasta raiz do projeto e execute

```
bundle install
```

## Running the tests

Para rodar toda a suíte de testes, execute o comando :
```
rspec
```
Para rodar algum caso específico por tag, execute:
```
rspec --t nometag
```

## Reports
Os reports são gerados em formato json e html e encontram-se na pasta results

Caso queira ver os reports gerados pelo Allure, instale as dependências do Allure
e execute o comando (após execução dos testes) 

```
allure serve report/allure-results
```