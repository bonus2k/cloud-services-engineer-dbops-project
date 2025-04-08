-- Вставляем данные в таблицу "product"
-- Добавляем информацию о продуктах: id, название, ссылка на изображение и цена
INSERT INTO product (id, name, picture_url, price)
VALUES
    (1, 'Сливочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/6.jpg', 320.00),
    (2, 'Особая', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/5.jpg', 179.00),
    (3, 'Молочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/4.jpg', 225.00),
    (4, 'Нюренбергская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/3.jpg', 315.00),
    (5, 'Мюнхенская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/2.jpg', 330.00),
    (6, 'Русская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/1.jpg', 189.00);

-- Вставляем случайные данные в таблицу "orders"
-- id: идентификатор заказа
-- status: случайный статус заказа (pending, shipped, cancelled)
-- date_created: случайная дата создания заказа в пределах последних 90 дней
INSERT INTO orders (id, status, date_created)
SELECT
    i,
(ARRAY['pending', 'shipped', 'cancelled'])[floor(random() * 3 + 1)],        -- случайный статус
    DATE(NOW() - (random() * (NOW() + INTERVAL '90 days' - NOW())))    -- случайная дата создания
FROM generate_series(1, 10000000) s(i);

-- Вставляем случайные данные в таблицу "order_product"
-- quantity: случайное количество от 1 до 50
-- order_id: id заказа
-- product_id: случайный id продукта (от 1 до 6, количество продуктов — 6)
INSERT INTO order_product (quantity, order_id, product_id)
SELECT
    floor(1 + random() * 50)::INT,  -- случайное количество
    i,                      -- идентификатор заказа
    floor(1 + random() * 6)::INT    -- случайный продукт
FROM generate_series(1, 10000000) s(i);