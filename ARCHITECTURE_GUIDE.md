```mermaid
flowchart LR
    subgraph ZENA["Root Repo: zena"]
        DC[docker-compose.yml]
        MK[Makefile]
    end

    subgraph APIFAST["apifast (submodule)"]
        API[FastAPI / HTTP API]
    end

    subgraph LANGGRAPH["langgraph (submodule)"]
        LG[Graph / Orchestration]
    end

    subgraph MCPSERVER["mcpserver (submodule)"]
        MCP[Agents / MCP / Tools]
    end

    DC --> APIFAST
    DC --> LANGGRAPH
    DC --> MCPSERVER

    APIFAST --> LANGGRAPH
    APIFAST --> MCP
```

```mermaid
flowchart LR
    subgraph ZENA["Root Repo: zena"]
        DEV[docker-compose.dev.yml]
        PROD[docker-compose.prod.yml]
        MK[Makefile]
        VERS[deploy/dev.env & deploy/prod.env]
    end

    subgraph APIFAST["apifast (submodule)"]
        API[FastAPI / HTTP API]
        ADEV[compose.dev.yml]
        APROD[compose.prod.yml]
    end

    subgraph LANGGRAPH["langgraph (submodule)"]
        LG[Graph / Orchestration]
        LDEV[compose.dev.yml]
        LPROD[compose.prod.yml]
    end

    subgraph MCPSERVER["mcpserver (submodule)"]
        MCP[Agents / MCP / Tools]
        MDEV[compose.dev.yml]
        MPROD[compose.prod.yml]
    end

    DEV --> ADEV
    DEV --> LDEV
    DEV --> MDEV

    PROD --> APROD
    PROD --> LPROD
    PROD --> MPROD

    VERS --> PROD
    API --> LG
    API --> MCP

```

```mermaid
sequenceDiagram
    Client->>apifast: HTTP request
    apifast->>langgraph: Build execution graph
    langgraph->>mcpserver: Run agent/tool
    mcpserver-->>langgraph: Result
    langgraph-->>apifast: Final response
    apifast-->>Client: HTTP response
```

---

# 🧪 Dev vs Prod на одной машине: порты, проекты, compose

Цель: запускать **DEV и PROD одновременно** на одном Docker-хосте без конфликтов.

## ✅ Принцип

- Внутренний порт контейнера **не меняем** (например `3024`).
- Внешний порт хоста **параметризуем** через переменную, например `${APIFAST_PORT}`.
- Запускаем dev и prod как **разные compose-проекты** через `-p`:
  - `-p zena-dev`
  - `-p zena-prod`

Так контейнеры, сети, volume и имена будут разделены на уровне Docker Compose.

---

## 1) Порты: как задавать правильно

В compose у сервиса:

```yaml
ports:
  - "${APIFAST_PORT}:3024"
