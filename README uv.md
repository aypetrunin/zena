# Определение установленных Python версий в системе
ls /usr/bin/python*
<!-- copilot_superuser@copilot:~$ python3.11 --version
Python 3.11.14
copilot_superuser@copilot:~$ python3.10 --version
Python 3.10.12 -->
# Проверка на какую версию указывает python3
ls -l /usr/bin/python3

# Проверка через uv
uv python list

cpython-3.13.5+freethreaded-linux-x86_64-gnu      <download available>
cpython-3.12.11-linux-x86_64-gnu                  <download available>
cpython-3.11.14-linux-x86_64-gnu                  /usr/bin/python3.11
cpython-3.11.13-linux-x86_64-gnu                  <download available>
cpython-3.10.18-linux-x86_64-gnu                  <download available>
cpython-3.10.12-linux-x86_64-gnu                  /usr/bin/python3.10
cpython-3.10.12-linux-x86_64-gnu                  /usr/bin/python3 -> python3.10
cpython-3.9.23-linux-x86_64-gnu                   <download available>
cpython-3.8.20-linux-x86_64-gnu                   <download available>
pypy-3.11.13-linux-x86_64-gnu                     <download available>
pypy-3.10.16-linux-x86_64-gnu                     <download available>
pypy-3.9.19-linux-x86_64-gnu                      <download available>
pypy-3.8.16-linux-x86_64-gnu                      <download available>
graalpy-3.11.0-linux-x86_64-gnu                   <download available>
graalpy-3.10.0-linux-x86_64-gnu                   <download available>
graalpy-3.8.5-linux-x86_64-gnu                    <download available>


# Создание виртуального окружения с помощью uv используя нужную версию Python
python3.11 -m venv .venv && source .venv/bin/activate
uv venv -p /usr/bin/python3.11 .venv && source .venv/bin/activate

# Проверка активного venv
python -c "import sys; print(sys.executable)"
python -c "import sys; print(sys.version)"

# Удаление виртуального окружения
deactivate && rm -rf .venv

# Установка пакетов из pyproject.toml в режиме разработчика
pip install .[dev]


# Установка Git
## Перход в рабочую папку
## Инициализация локального git
## Установка локального пользователя git
## Проверка настроек 
cd /home/copilot_superuser/petrunin/zena/mcp
git init
git config user.name "aypetrunin"
git config user.email "a.y.petrunin@gmail.com"
git config --list

## Прверка статуса
git status
