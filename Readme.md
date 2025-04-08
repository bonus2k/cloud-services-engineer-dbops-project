# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

## Создание БД
### (пароль скрыт в целях безопасности)
```bash
export PGPASSWORD='password1'
psql -U admin_9qml -h localhost -d postgres -c 'CREATE DATABASE store;'
```

## Добавление пользователя для выполнения миграции и тестов
### (пароль скрыт в целях безопасности)
```bash
psql -U admin_9qml -h localhost -d store
CREATE ROLE migration_service_9qml WITH LOGIN PASSWORD 'password2';
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO migration_service_9qml;
GRANT CREATE ON SCHEMA public TO migration_service_9qml;
```

## Запрос
### Показывает, какое количество сосисок было продано за каждый день предыдущей недели:
```sql
SELECT o.date_created, SUM(op.quantity)
FROM orders AS o
JOIN order_product AS op ON o.id = op.order_id
WHERE o.status = 'shipped' AND o.date_created > NOW() - INTERVAL '7 DAY'
GROUP BY o.date_created;
```