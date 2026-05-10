# 🤖 Smart-voice-api-spring-boot
![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=spring-boot&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Conclu%C3%ADdo-brightgreen?style=for-the-badge)
> **Desafio de Projeto:** API desenvolvida como parte do currículo da [DIO](https://www.dio.me/), focada em demonstrar a integração de IA Generativa e Multimodalidade no ecossistema Java.
Esta é uma **API Inteligente** construída com **Spring Boot** e **Spring AI**. A aplicação atua como um assistente financeiro capaz de processar comandos de voz, convertê-los em texto, interpretar a intenção do utilizador via LLMs e executar ações programáticas, como a persistência de transações em base de dados.
## 🚀 Funcionalidades
* **Processamento Multimodal:** Suporte nativo para entrada de áudio e síntese de voz (Text-to-Speech).
* **Integração com Spring AI:** Orquestração fluida de modelos de linguagem (OpenAI/Gemini).
* **Tool Calling (Function Calling):** Capacidade da IA de invocar métodos Java reais para registar despesas ou consultar orçamentos.
* **Contexto e Fluência:** Gestão de histórico para manter conversas coerentes.
* **Infraestrutura com Docker:** Ambiente de persistência PostgreSQL pronto a usar via Docker Compose.
## 🏗️ Arquitetura do Fluxo
1.  **Transcrição:** Receção de áudio via REST e conversão para texto (`Transcription API`).
2.  **Raciocínio:** O `ChatClient` interpreta o comando (ex: "Gastei 50 reais com combustível").
3.  **Execução:** Através de **Tool Calling**, a IA decide chamar o serviço de persistência.
4.  **Feedback:** O sistema retorna uma confirmação textual e/ou sintetizada em áudio (`Speech API`).
## 🔧 Configuração e Execução
### Pré-requisitos
* JDK 21
* Docker Desktop
* API Key (OpenAI ou Google AI Studio)
### Passos
1.  **Clonar o repositório:**
    ```bash
    git clone [https://github.com/teu-utilizador/smart-voice-api-spring-boot.git](https://github.com/teu-utilizador/smart-voice-api-spring-boot.git)
    ```
2.  **Configurar chaves:**
    No ficheiro `src/main/resources/application.properties`, adicione a sua credencial:
    ```properties
    spring.ai.openai.api-key=${OPENAI_API_KEY}
    ```
3.  **Subir o banco de dados:**
    ```bash
    docker-compose up -d
    ```
4.  **Executar:**
    ```bash
    ./mvnw spring-boot:run
    ```
## 📝 Principais Endpoints

| Método | Endpoint | Descrição |
| :--- | :--- | :--- |
| `POST` | `/api/v1/transcription` | Recebe áudio e processa a intenção financeira. |
| `POST` | `/api/v1/chat` | Interface de chat textual com contexto. |
| `GET` | `/api/v1/budget/summary` | Resumo de gastos processado pela inteligência. |

---
## 👨‍💻 Autor
**Maike Simoncini da Silva**
*ADS Technologist | Especialista em Automação e IA* 

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/maike-simoncini-da-silva-9769b2287)
