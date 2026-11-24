DROP TABLE IF EXISTS order_item CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS product CASCADE;
DROP TABLE IF EXISTS customer CASCADE;

CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    email VARCHAR(120) UNIQUE
);

CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price NUMERIC(8,2) NOT NULL CHECK (price > 0)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customer(customer_id),
    order_date DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE order_item (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id INT NOT NULL REFERENCES product(product_id),
    quantity INT NOT NULL CHECK (quantity > 0)
);

INSERT INTO customer (full_name, department, email) VALUES
('Tuğra Tekin', 'YBS', 'tugra@kampuskafe.edu.tr'),
('Elif Yılmaz', 'YBS', 'elif@kampuskafe.edu.tr'),
('Mert Kaya', 'Bilgisayar Mühendisliği', 'mert@kampuskafe.edu.tr'),
('Zeynep Demir', 'Endüstri Mühendisliği', NULL),
('Can Arslan', 'YBS', 'can@kampuskafe.edu.tr');

INSERT INTO product (name, category, price) VALUES
('Filtre Kahve', 'İçecek', 45.00),
('Latte', 'İçecek', 65.00),
('Soğuk Sandviç', 'Yiyecek', 85.00),
('Tost', 'Yiyecek', 60.00),
('Brownie', 'Tatlı', 75.00),
('Su', 'İçecek', 15.00);

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2026-11-20'),
(1, '2026-11-22'),
(2, '2026-11-21'),
(3, '2026-11-22');

INSERT INTO order_item (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 5, 1),
(2, 2, 2),
(3, 3, 1),
(3, 6, 1),
(4, 4, 2);