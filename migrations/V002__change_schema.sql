-- Добавляем новый столбец "price" в таблицу "product"
-- Тип данных: DOUBLE PRECISION (вещественное число двойной точности)
ALTER TABLE product
    ADD COLUMN price DOUBLE PRECISION;

-- Добавляем первичный ключ "product_pkey" к таблице "product" для столбца "id"
ALTER TABLE product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


-- Добавляем новый столбец "date_created" в таблицу "orders"
-- Тип данных: DATE (дата)
-- Значение по умолчанию: текущая дата (CURRENT_DATE) на момент добавления записи
ALTER TABLE orders
    ADD COLUMN date_created DATE DEFAULT CURRENT_DATE;


-- Добавляем первичный ключ "orders_pkey" к таблице "orders" для столбца "id"
ALTER TABLE orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


-- Добавляем внешнее ключевое ограничение "fk_product" к таблице "order_product"
-- Поле "product_id" будет ссылаться на "id" в таблице "product"
ALTER TABLE order_product
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id)
        REFERENCES product (id);

-- Добавляем внешнее ключевое ограничение "fk_orders" к таблице "order_product"
-- Поле "order_id" будет ссылаться на "id" в таблице "orders"
ALTER TABLE order_product
    ADD CONSTRAINT fk_orders FOREIGN KEY (order_id)
        REFERENCES orders (id);

-- Удаляем таблицу "orders_date", поскольку она больше не используется
-- Все данные внутри таблицы будут потеряны
DROP TABLE orders_date;

-- Удаляем таблицу "product_info", поскольку она больше не используется
-- Все данные внутри таблицы будут потеряны
DROP TABLE product_info;