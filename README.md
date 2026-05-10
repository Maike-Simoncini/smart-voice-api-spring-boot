# 🤖 Smart-Voice-API-Spring-Boot

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=spring-boot&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Conclu%C3%ADdo-brightgreen?style=for-the-badge)

Esta é uma API Inteligente desenvolvida com **Spring Boot 3** e **Spring AI**, focada na automação de registros financeiros através de comandos de voz. O projeto demonstra a integração de LLMs (Large Language Models) com sistemas de persistência legados através de técnicas de **Tool Calling** e processamento de áudio **Whisper**.

## 🎯 Objetivo do Projeto
Transformar comandos de voz informais (ex: "Gastei 50 reais com pizza agora pouco") em dados estruturados dentro de um banco de dados relacional, utilizando Inteligência Artificial para interpretação de intenção e extração de entidades.

---

## 🏗️ Arquitetura e Fluxo de Dados

O projeto segue os padrões de Clean Architecture, garantindo a separação entre a lógica de entrada (Web), processamento (Service) e persistência (JPA).



1. **Entrada:** O usuário envia um arquivo de áudio via endpoint REST.
2. **Transcrição:** O motor `OpenAiAudioTranscriptionModel` (Whisper) converte o áudio em texto.
3. **Processamento:** O `ChatClient` interpreta o texto e identifica valores e categorias.
4. **Ação:** Através de **Function Calling**, a IA invoca métodos Java para persistir a transação.
5. **Persistência:** Os dados são salvos no **PostgreSQL** rodando em container Docker.

---

## 🚀 Tecnologias Utilizadas

* **Java 21:** Versão LTS para performance e segurança.
* **Spring Boot 3.2.x:** Framework base para a API.
* **Spring AI:** Abstração de alto nível para integração com modelos OpenAI/Gemini.
* **Docker & Docker Compose:** Containerização da infraestrutura de dados.
* **PostgreSQL:** Banco de dados relacional para persistência segura.
* **Lombok:** Produtividade no desenvolvimento das entidades.

---

## 🔧 Como Executar

### Pré-requisitos
* Docker Desktop instalado.
* JDK 21 instalado.
* Uma API Key da OpenAI ou Google AI Studio.

### 1. Configuração do Ambiente
Clone o repositório e configure as suas credenciais no arquivo `src/main/resources/application.properties` ou como variáveis de ambiente:

```bash
export OPENAI_API_KEY='sua_chave_aqui'

```
### 2. Subir a Infraestrutura (Docker)
Na raiz do projeto, execute o comando para subir o banco de dados e o Adminer:
```bash
docker-compose up -d

```
### 3. Rodar a Aplicação
Utilize o Maven Wrapper incluído no projeto:
```bash
# Windows
.\mvnw.cmd spring-boot:run

# Linux/Mac
./mvnw spring-boot:run

```
## 🛡️ Considerações de Segurança (Cybersecurity)
Como tecnólogo em ADS com foco em segurança, este projeto aplica:
 * **Variáveis de Ambiente:** Nenhuma chave de API está exposta no código-fonte.
 * **Multipart Validation:** Controle de tamanho e tipo de arquivo no upload de áudio.
 * **Isolamento de Redes:** Banco de dados rodando em container isolado, acessível apenas via autenticação.
 * **.gitignore Rigoroso:** Proteção contra envio de binários do Maven e pastas de configuração de IDEs.

## 👨‍💻 Autor
**Maike Simoncini da Silva**
*ADS Technologist | Cybersecurity Enthusiast*

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/maike-simoncini-da-silva-9769b2287)
