@echo off
copy /Y "./.env.example" ".env"
docker compose exec php composer update
docker compose exec php php artisan key:generate
start http://localhost:8080/
