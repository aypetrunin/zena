# .env
1. Добавляем новые переменные в соответсвующие разделы файла с переменными окружения **deploy/dev.env**, **deploy/prod.env**

        ## MCPSERVER
        MCP_PORT_ALISA=15001
        MCP_PORT_SOFIA=15002
        MCP_PORT_ANISA=15005
        MCP_PORT_ANNITTA=15006
        MCP_PORT_ANASTASIA=15007
        MCP_PORT_ALENA=15020
        MCP_PORT_VALENTINA=15021

        CHANNEL_IDS_SOFIA=1,19
        CHANNEL_IDS_ALISA=2
        CHANNEL_IDS_ANISA=5
        CHANNEL_IDS_ANNITTA=6
        CHANNEL_IDS_ANASTASIA=7
        CHANNEL_IDS_ALENA=20
        CHANNEL_IDS_VALENTINA=21

# mcpserver
1. Создаем копию mcp-server в каталоге **mcpserver/src/server** из наиболее подходящего варианта.
2. Меняем соответствующие названия.
3. Регистрируем новый сервер в **mcpserver/src/server/server_registry.py**
4. Открываем порты в **mcpserver/docker-compose.prod.yml**
5. Открываем порты в **mcpserver/docker-compose.dev.yml**

# langgraph
1. Добавляем нового агента в **langgraph/src/zena_create_graph.py**
2. Добавляем нового агента в **langgraph/langgraph.json**
3. Добавляем нового агента в **langgraph/Dockerfile**
4. Добаляем порт в **langgraph/src/zena_middleware_wrap_model.py** строка 186
5. Добаляем порт в **langgraph/src/zena_middleware_wrap_tool.py** строка 11

# apifast
1. добавляем агента в **apifast/src/schemas.py** строка 32