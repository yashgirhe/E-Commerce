INSERT INTO orders (total_price, order_status) VALUES
(150.75, 'PENDING'),
(249.99, 'CONFIRMED'),
(349.50, 'DELIVERED'),
(0.00, 'CANCELLED'),
(89.99, 'PENDING');


-- For order with id 1
INSERT INTO order_item (order_id, product_id, quantity) VALUES (1, 2, 1);  -- 2 Laptops
INSERT INTO order_item (order_id, product_id, quantity) VALUES (3, 3, 1);  -- 3 Headphones

-- For order with id 2
INSERT INTO order_item (order_id, product_id, quantity) VALUES (2, 1, 2);  -- 1 Smartphone
INSERT INTO order_item (order_id, product_id, quantity) VALUES (5, 2, 2);  -- 2 Monitors

-- For order with id 3
INSERT INTO order_item (order_id, product_id, quantity) VALUES (4, 1, 3);  -- 1 Smartwatch

-- For order with id 4 (Cancelled order, no items)
-- No order items as the order is cancelled.

-- For order with id 5
--INSERT INTO order_item (order_id, product_id, quantity) VALUES (6, 3, 5);  -- 3 Keyboards
--INSERT INTO order_item (order_id, product_id, quantity) VALUES (9, 1, 5);  -- 1 Tablet
