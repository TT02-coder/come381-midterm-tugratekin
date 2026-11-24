-- Q1: Fiyatı 50 TL'den yüksek ürünleri pahalıdan ucuza sırala.
-- Ne işe yarar: Kafedeki yüksek fiyatlı ürünleri belirleyip menü fiyatlandırmasını ve ürün gelir potansiyelini hızlıca görmeyi sağlar.
SELECT name, price
FROM product
WHERE price > 50
ORDER BY price DESC;

-- Q2: 'YBS' bölümündeki müşterilerin adlarını alfabetik sırala.
-- Ne işe yarar: YBS bölümündeki müşteri listesini düzenli şekilde çıkarıp duyuru veya kampanya planlamasına yardımcı olur.
SELECT full_name
FROM customer
WHERE department = 'YBS'
ORDER BY full_name ASC;

-- Q3: Her siparişin numarasını, tarihini ve müşterinin adını listele.
-- Ne işe yarar: Hangi siparişin hangi tarihte ve kim tarafından verildiğini bir arada göstererek sipariş takibini kolaylaştırır.
SELECT o.order_id, o.order_date, c.full_name
FROM orders o
INNER JOIN customer c ON c.customer_id = o.customer_id
ORDER BY o.order_id;

-- Q4: Her sipariş kaleminin ürün adını ve adedini listele.
-- Ne işe yarar: Siparişlerde hangi üründen kaçar adet satıldığını göstererek ürün talebini ve stok tüketimini izlemeye yarar.
SELECT p.name, oi.quantity
FROM order_item oi
INNER JOIN product p ON p.product_id = oi.product_id
ORDER BY oi.order_id, p.product_id;

-- Q5: Her müşterinin kaç sipariş verdiğini müşteri adıyla listele.
-- Ne işe yarar: Müşterilerin sipariş sıklığını ortaya çıkararak düzenli müşterileri ve henüz sipariş vermeyenleri tespit etmeye yardımcı olur.
SELECT c.full_name, COUNT(o.order_id) AS siparis_sayisi
FROM customer c
LEFT JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY c.customer_id;

-- Q6: Her ürün kategorisinin ortalama fiyatını bul.
-- Ne işe yarar: Kategoriler arasındaki fiyat seviyesini karşılaştırarak menüdeki ürün fiyatlarının tutarlılığını kontrol etmeyi sağlar.
SELECT category, ROUND(AVG(price), 2) AS ortalama_fiyat
FROM product
GROUP BY category
ORDER BY category;