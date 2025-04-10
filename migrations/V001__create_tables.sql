-- Таблица для хранения информации о продуктах
CREATE TABLE product (
        id          BIGINT GENERATED BY DEFAULT AS IDENTITY, -- Уникальный идентификатор продукта
        name        VARCHAR(255) NOT NULL,                   -- Название продукта
        picture_url VARCHAR(255)                             -- URL изображения продукта
);

-- Таблица для хранения дополнительной информации о продуктах
CREATE TABLE product_info (
        product_id BIGINT NOT NULL,                -- Идентификатор продукта (ссылка на product.id)
        name VARCHAR(255) NOT NULL,                -- Название (может дублировать основное название в таблице product)
        price DOUBLE PRECISION                     -- Цена продукта
);

-- Таблица для хранения информации о заказах
CREATE TABLE orders (
        id BIGINT GENERATED BY DEFAULT AS IDENTITY, -- Уникальный идентификатор заказа
        status VARCHAR(255)                         -- Статус заказа (например, "в обработке", "доставлен")
);

-- Таблица для хранения даты создания заказа и дополнительного статуса
CREATE TABLE orders_date (
        order_id BIGINT NOT NULL,                 -- Идентификатор заказа (ссылка на orders.id)
        status VARCHAR(255),                      -- Статус заказа (дублирующая информация из orders)
        date_created DATE DEFAULT CURRENT_DATE    -- Дата создания заказа (по умолчанию текущая дата)
);

-- Таблица для хранения связи заказов с продуктами
CREATE TABLE order_product (
        quantity INTEGER NOT NULL,                -- Количество продукта в заказе
        order_id BIGINT NOT NULL,                 -- Идентификатор заказа (ссылка на orders.id)
        product_id BIGINT NOT NULL                -- Идентификатор продукта (ссылка на product.id)
);