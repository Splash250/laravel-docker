@echo off
copy /Y "./.env.example" ".env"
docker compose up -d --build
docker compose exec php composer update
docker compose exec php php artisan key:generate
docker compose exec php php artisan session:table
docker compose exec php php artisan migrate
start http://localhost:8080/
