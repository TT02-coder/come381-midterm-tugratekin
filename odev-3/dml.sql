\set VERBOSITY verbose

BEGIN;

SELECT product_id, name, price
FROM product
WHERE category = 'Sıcak İçecek'
ORDER BY product_id;

UPDATE product
SET price = price + 5
WHERE category = 'Sıcak İçecek';

SELECT product_id, name, price
FROM product
WHERE category = 'Sıcak İçecek'
ORDER BY product_id;

INSERT INTO order_item (order_id, product_id, quantity)
VALUES (1, 999, 1);

ROLLBACK;

SELECT product_id, name, price
FROM product
WHERE category = 'Sıcak İçecek'
ORDER BY product_id;