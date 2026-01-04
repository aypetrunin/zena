.PHONY: setup lint lint_fix format format_all \
        lint_apifast lint_langgraph lint_mcpserver \
        format_apifast format_langgraph format_mcpserver

# Обнуляем активное окружение (рaзрываем связь с активированным .venv)
export VIRTUAL_ENV :=

# =============== УСТАНОВКА ЗАВИСИМОСТЕЙ ВО ВСЕХ ПОДПРОЕКТАХ ===============
setup:
	$(MAKE) setup_apifast
	$(MAKE) setup_langgraph
	$(MAKE) setup_mcpserver

setup_apifast:
	$(MAKE) -C apifast setup

setup_langgraph:
	$(MAKE) -C langgraph setup

setup_mcpserver:
	$(MAKE) -C mcpserver setup

# =============== ЛИНТИНГ ВО ВСЕХ ПОДПРОЕКТАХ ===============
lint: lint_apifast lint_langgraph lint_mcpserver

lint_apifast:
	$(MAKE) -C apifast lint

lint_langgraph:
	$(MAKE) -C langgraph lint

lint_mcpserver:
	$(MAKE) -C mcpserver lint

lint_fix: lint_fix_apifast lint_fix_langgraph lint_fix_mcpserver

lint_fix_apifast:
	$(MAKE) -C apifast lint_fix

lint_fix_langgraph:
	$(MAKE) -C langgraph lint_fix

lint_fix_mcpserver:
	$(MAKE) -C mcpserver lint_fix

# =============== ФОРМАТИРОВАНИЕ ВО ВСЕХ ПОДПРОЕКТАХ ===============
format: format_apifast format_langgraph format_mcpserver

format_apifast:
	$(MAKE) -C apifast format

format_langgraph:
	$(MAKE) -C langgraph format

format_mcpserver:
	$(MAKE) -C mcpserver format

# =============== АГРЕГАТОРЫ ДЛЯ ВСЕГО РЕПО ===============
format_all: format     # алиас для семантической ясности


# make setup              # установить все зависимости (включая dev)
# make lint               # проверить текущий проект или подпроекты
# make lint_fix           # исправить автоисправляемые ошибки Ruff'ом
# make format             # отформатировать код (SRC=src по умолчанию)
# make format_all         # отформатировать все подпроекты
# make lint_apifast       # линт только apifast
# make lint_langgraph     # линт только langgraph
# make lint_mcpserver     # линт только mcpserver
# make format_apifast     # форматирование кода apifast
# make format_langgraph   # форматирование кода langgraph
# make format_mcpserver   # форматирование кода mcpserver