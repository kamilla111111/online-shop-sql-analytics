--«¿œ–Œ— 1: “Œœ 5  À»≈Õ“Œ¬ œŒ “–¿“¿Ã 

SELECT†
† † c.customer_id,
† † c.full_name,
† † SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_spent DESC
LIMIT 5;
-- «¿œ–Œ— 2: —¿Ã€… œŒœ”Àﬂ–Õ€… “Œ¬¿–

SELECT†
† † p.product_name,
† † SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 1;
-- «¿œ–Œ— 3: “Œ¬¿–€ ¡≈« œ–Œƒ¿∆
SELECT†
† † p.product_id,
† † p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
-- «¿œ–Œ— 4: —–≈ƒÕ»… ◊≈ 
SELECT†
† † ROUND(AVG(order_total), 2) AS average_order_value
FROM (
† † SELECT†
† † † † o.order_id,
† † † † SUM(oi.quantity * oi.unit_price) AS order_total
† † FROM orders o
† † JOIN order_items oi ON o.order_id = oi.order_id
† † GROUP BY o.order_id
) AS order_totals;

-- «¿œ–Œ— 5: —¿Ã€… ƒŒ–Œ√Œ… «¿ ¿«  ¿∆ƒŒ√Œ  À»≈Õ“¿

WITH order_totals AS (
† † SELECT†
† † † † o.order_id,
† † † † o.customer_id,
† † † † SUM(oi.quantity * oi.unit_price) AS order_total
† † FROM orders o
† † JOIN order_items oi ON o.order_id = oi.order_id
† † GROUP BY o.order_id, o.customer_id
),
ranked_orders AS (
† † SELECT†
† † † † customer_id,
† † † † order_id,
† † † † order_total,
† † † † RANK() OVER (
† † † † † † PARTITION BY customer_id
† † † † † † ORDER BY order_total DESC
† † † † ) AS order_rank
† † FROM order_totals
)
SELECT†
† † c.full_name,
† † r.order_id,
† † r.order_total
FROM ranked_orders r
JOIN customers c ON r.customer_id = c.customer_id
WHERE r.order_rank = 1;
