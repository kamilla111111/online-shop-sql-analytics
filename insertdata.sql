INSERT INTO customers (full_name, email, city) VALUES
('Иван Петров', 'ivan@mail.com', 'Москва'),
('Анна Смирнова', 'anna@mail.com', 'Казань'),
('Олег Иванов', 'oleg@mail.com', 'Санкт-Петербург'),
('Мария Орлова', 'maria@mail.com', 'Москва'),
('Дмитрий Волков', 'dima@mail.com', 'Екатеринбург');

INSERT INTO products (product_name, category, price, stock) VALUES
('iPhone 15', 'Смартфоны', 90000, 10),
('Samsung Galaxy S24', 'Смартфоны', 85000, 8),
('MacBook Air', 'Ноутбуки', 130000, 5),
('Наушники Sony', 'Аксессуары', 15000, 20),
('Клавиатура Logitech', 'Аксессуары', 7000, 15),
('Игровая мышь Razer', 'Аксессуары', 6000, 0);

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2026-01-10'),
(1, '2026-02-15'),
(2, '2026-02-20'),
(3, '2026-03-01'),
(4, '2026-03-05');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 90000),
(1, 4, 2, 15000),
(2, 3, 1, 130000),
(3, 2, 1, 85000),
(3, 5, 2, 7000),
(4, 4, 3, 15000),
(5, 1, 1, 90000);