# spring-template

Template base para projetos Spring Boot com PostgreSQL e Dev Container.

## Stack

- Java 17
- Spring Boot 3.4.2
- Maven
- PostgreSQL 17
- JPA / Hibernate
- Dev Containers

## Banco de dados

Usuário da aplicação:

- Usuário: `spring`
- Senha: `pass123`
- Banco: `postgres`
- Porta: `5432`

## Como executar

Abra o projeto no VS Code e execute:

`Dev Containers: Rebuild and Reopen in Container`

Depois:

```bash
./mvnw clean test
./mvnw spring-boot:run