cd /home/copilot_superuser/petrunin/zena
docker compose down
docker compose build --no-cache
docker compose up -d


docker logs -f zena_langgraph_api
docker logs -f zena_mcp
docker logs -f zena_apifast 