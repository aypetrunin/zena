cd /home/copilot_superuser/petrunin/zena
docker compose down
docker compose build --no-cache
docker compose up -d


docker logs -f zena_langgraph_api
docker logs -f zena_mcp
docker logs -f zena_apifast 


# prod/dev
## prod
cd /home/copilot_superuser/petrunin/zena
docker compose -p zena-prod -f docker-compose.prod.yml --env-file deploy/prod.env down
docker compose -p zena-prod -f docker-compose.prod.yml --env-file deploy/prod.env build --no-cache
docker compose -p zena-prod -f docker-compose.prod.yml --env-file deploy/prod.env up -d

docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep zena-prod

docker logs -f zena-prod-langgraph-api-1
docker logs -f zena-prod-mcpsrv-1
docker logs -f zena-prod-apifast-1 


# ✅ РЕКОМЕНДОВАННЫЙ safe-набор для prod
## контейнеры
docker ps -a --filter label=com.docker.compose.project=zena-prod
### build-кэш
docker builder prune -a --filter "label=com.docker.compose.project=zena-prod"
## образы
docker images -q --filter "label=com.docker.compose.project=zena-prod" | xargs -r docker rmi



## dev
cd /home/copilot_superuser/petrunin/zena
docker compose -p zena-dev -f docker-compose.dev.yml --env-file deploy/dev.env down
docker compose -p zena-dev -f docker-compose.dev.yml --env-file deploy/dev.env build --no-cache
docker compose -p zena-dev -f docker-compose.dev.yml --env-file deploy/dev.env up -d

docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep zena-dev

docker logs -f zena-dev-mcpsrv-1
docker logs -f zena-dev-apifast-1 
docker logs -f zena-dev-langgraph-api-1

cd ~/petrunin/zena/mcpserver
docker compose config | sed -n '/mcpsrv:/,/^[^ ]/p'