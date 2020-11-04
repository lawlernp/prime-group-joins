-- 1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders"
JOIN "line_items" ON "orders".id = "line_items".order_id;

-- 3. Which warehouses have cheetos?
SELECT * FROM "warehouse"
JOIN "warehouse_product" on "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" on "warehouse_product".product_id = "products".id
WHERE "products".id = 5;

-- 4. Which warehouses have diet pepsi?
SELECT * FROM "warehouse"
JOIN "warehouse_product" on "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" on "warehouse_product".product_id = "products".id
WHERE "products".id = 6;

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "first_name", "last_name", count("customers".id) FROM "orders"
JOIN "addresses" ON "orders".address_id = "addresses".id
JOIN "customers" ON "addresses".customer_id = "customers".id
GROUP BY "customers".id;

-- 6. How many customers do we have?
SELECT count("id") FROM "customers";

-- 7. How many products do we carry?
SELECT count("id") FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand") FROM "warehouse_product"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."id" = 6;