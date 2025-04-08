# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

## Создание БД 
### (пароль скрыт в целях безопасности)

`export PGPASSWORD='password1'`

`psql -U admin_9qml -h localhost -d postgres -c 'CREATE DATABASE store;' `

## Добавление пользователя для выполнения миграции и тестов
### (пароль скрыт в целях безопасности)

`psql -U admin_9qml -h localhost -d store`

`CREATE ROLE migration_service_9qml WITH LOGIN PASSWORD 'password2';`

`GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO migration_service_9qml;`







