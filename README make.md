cd /home/copilot_superuser/petrunin/zena


make setup         # установить зависимости во всех подпроектах
make lint          # линтинг всех подпроектов (ruff)
make lint_fix      # автоисправление ошибок во всех подпроектах (ruff --fix)
make format        # форматирование кода во всех подпроектах (ruff format)

make lint_apifast        # линтинг только для apifast
make lint_langgraph      # линтинг только для langgraph
make lint_mcpserver      # линтинг только для mcpserver

make format_apifast      # форматирование только apifast
make format_langgraph    # форматирование только langgraph
make format_mcpserver    # форматирование только mcpserver

make setup_apifast       # только установка зависимостей apifast
make setup_langgraph     # только установка зависимостей langgraph
make setup_mcpserver     # только установка зависимостей mcpserver

make lint_fix_apifast    # только автоисправление apifast
make lint_fix_langgraph  # только автоисправление langgraph
make lint_fix_mcpserver  # только автоисправление mcpserver
