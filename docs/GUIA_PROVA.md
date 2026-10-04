# Guia rápido para a prova

## 1. Clonar o template

No PowerShell:

```powershell
cd C:\Users\mgermano\Desktop
mkdir prova1
cd prova1
git clone https://github.com/m-germano/spring-template.git .
code .
```

---

## 2. Colar o SQL fornecido pelo professor

Abra:

```text
.devcontainer/postgres/prova.sql
```

Cole dentro dele o SQL fornecido na avaliação.

Exemplo:

```sql
create table alguma_tabela (
    ...
);
```

Não alterar:

```text
init.sql
base.sql
```

---

## 3. Abrir o Dev Container

No VS Code:

```text
Ctrl + Shift + P
```

Procure:

```text
Dev Containers: Rebuild and Reopen in Container
```

Na primeira inicialização, o PostgreSQL executará:

```text
01-init.sql
02-base.sql
03-prova.sql
```

---

## 4. Resolver o exercício

Seguir sempre esta ordem:

```text
SQL
 ↓
Entity
 ↓
Repository
 ↓
Service
 ↓
Controller
 ↓
Testes HTTP
```

### Entity

Criar em:

```text
src/main/java/br/com/app/api/entity/
```

Lembrar:

```text
Tabela                  -> @Entity + @Table
Primary Key             -> @Id
Identity                -> @GeneratedValue
Coluna                  -> @Column
Foreign Key             -> relacionamento JPA
timestamp               -> LocalDateTime
```

### Repository

Criar em:

```text
src/main/java/br/com/app/api/repository/
```

Base:

```java
public interface MinhaRepository
        extends JpaRepository<MinhaEntity, Long> {
}
```

### Service

Criar em:

```text
src/main/java/br/com/app/api/service/
```

Colocar aqui:

```text
validações
regras de negócio
save()
findAll()
consultas específicas
```

### Controller

Criar em:

```text
src/main/java/br/com/app/api/controller/
```

Anotações mais comuns:

```java
@RestController
@RequestMapping
@GetMapping
@PostMapping
@PutMapping
@DeleteMapping
@RequestBody
@RequestParam
@PathVariable
```

---

## 5. Compilar e testar

Primeiro:

```bash
./mvnw clean test
```

Resultado esperado:

```text
BUILD SUCCESS
```

---

## 6. Executar a aplicação

```bash
./mvnw spring-boot:run
```

Resultado esperado:

```text
Tomcat started on port 8080
Started ApiApplication
```

A API estará em:

```text
http://localhost:8080
```

---

## 7. Testar as requisições

Abra:

```text
docs/requests.http
```

Altere:

```text
/recurso
```

para a URL solicitada na prova.

Clique em:

```text
Send Request
```

acima de cada requisição.

---

## 8. Se precisar recriar o banco do zero

Isso é necessário principalmente quando:

- alterou `prova.sql`;
- quer testar outra prova;
- quer reexecutar os scripts SQL desde o início;
- ficou com dados de uma tentativa anterior.

Feche o Dev Container.

No PowerShell do Windows, na raiz do projeto:

```powershell
.\scripts\reset-docker.ps1
```

Depois abra novamente:

```text
Dev Containers: Rebuild and Reopen in Container
```

O banco será criado novamente do zero.

---

# Checklist rápido

Antes de entregar:

- [ ] SQL executado sem erro
- [ ] Entity criada
- [ ] PK mapeada corretamente
- [ ] Relacionamentos mapeados
- [ ] Repository criado
- [ ] Consulta específica criada
- [ ] Service criado
- [ ] Validações implementadas
- [ ] Controller criado
- [ ] Rotas corretas
- [ ] `./mvnw clean test` passou
- [ ] aplicação iniciou
- [ ] GET testado
- [ ] POST testado
- [ ] demais rotas testadas
