-- Создаём индекс на таблице orders для оптимизации фильтрации по колонкам status и date_created.
-- Комбинированный индекс используется для эффективной работы запроса с условием WHERE:
-- 1. Фильтрация по status ('shipped').
-- 2. Фильтрация по диапазону дат (date_created > NOW() - INTERVAL '7 DAY').
CREATE INDEX idx_orders_status_date ON orders (status, date_created);

-- Создаём индекс на таблице order_product для оптимизации соединения с таблицей orders.
-- Индекс помогает PostgreSQL быстрее выполнять соединение по ключу order_product.order_id = orders.id.
CREATE INDEX idx_order_product_order_id ON order_product (order_id);

