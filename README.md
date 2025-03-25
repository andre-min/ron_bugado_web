# Projeto de Teste Web - Ron-Bugado

Este projeto tem como objetivo automatizar os testes de uma aplicação web utilizando **Robot Framework**. Desenvolvido no ambiente **Academy da Qa.Coders**, a cada *push* no repositório, a pipeline do GitHub Actions é acionada para validar os testes executados.

---

## 🚀 Tecnologias Utilizadas

- 🐍 Python 3.10 ou superior
- 🤖 Robot Framework
- 🖥️ SeleniumLibrary (Robot Framework)

---

## 📂 Estrutura do Projeto

```
├── env.example                # Arquivo de exemplo para configuração do .env
├── load_env.py                # Carregamento das variáveis de ambiente
├── log                        # Diretório para logs de execução
├── README.md                  # Este arquivo
├── requirements.txt           # Dependências do projeto
├── resources                  # Arquivos de recursos do Robot Framework
│   ├── keyword.resource       # Palavras-chave personalizadas
│   ├── libs                   # Bibliotecas personalizadas
│   └── variables.resource     # Variáveis do projeto
├── ron_bugado_web.txt         # Relatório de execução (exemplo)
├── tests                      # Testes automatizados
│   ├── cadastro_entidades.robot  # Teste de cadastro de entidades
│   └── login.robot            # Teste de login
└── venv                       # Ambiente virtual (não versionado)
```

---

## ⚙️ Configuração e Execução

### 📌 Pré-requisitos

- Ter o **Python 3.10 ou superior** instalado. Caso não tenha, faça o download no [site oficial](https://www.python.org/downloads).

### ▶️ Passos para Rodar o Projeto

#### 1️⃣ Clonar o Repositório

```bash
git clone https://github.com/usuario/ron-bugado.git
cd ron-bugado
```

#### 2️⃣ Criar o Ambiente Virtual

- Para **Linux/macOS**:

  ```bash
  python3 -m venv venv
  ```

- Para **Windows**:

  ```powershell
  python -m venv venv
  ```

#### 3️⃣ Ativar o Ambiente Virtual

- Para **Linux/macOS**:

  ```bash
  source venv/bin/activate
  ```

- Para **Windows** (Prompt de Comando):

  ```cmd
  venv\Scripts\activate
  ```

- Para **Windows** (PowerShell):

  ```powershell
  venv\Scripts\Activate.ps1
  ```

#### 4️⃣ Instalar as Dependências

```bash
pip install -r requirements.txt
```

#### 5️⃣ Configurar as Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto com as credenciais necessárias (email e senha). Utilize `env.example` como referência.

**⚠️ Atenção:** Este arquivo **não deve ser versionado** para evitar exposição de dados sensíveis.

#### 6️⃣ Executar os Testes

Para rodar todos os testes:

```bash
robot -d log tests/.
```

Para executar um teste específico:

- **Teste de login**:
  ```bash
  robot -d log tests/login.robot
  ```

- **Teste de cadastro de entidades**:
  ```bash
  robot -d log tests/cadastro_entidades.robot
  ```

---

✅ **Pronto! Agora você pode rodar os testes automatizados do Ron-Bugado com facilidade.** 🚀

