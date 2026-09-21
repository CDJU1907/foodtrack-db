-- FoodTrack DB - Carga de datos iniciales (desde los CSV proporcionados)

USE FoodTrack_DB;
GO

-- foodtrucks
INSERT INTO foodtrucks (name, cuisine_type, city)
VALUES
('Taco Loco', 'Mexicana', 'Ciudad de México'),
('Burger Bros', 'Americana', 'Buenos Aires');

-- products
-- Nota: foodtruck_id generado por IDENTITY: 1 = Taco Loco, 2 = Burger Bros
INSERT INTO products (foodtruck_id, name, price, stock)
VALUES
(1, 'Taco al pastor', 50, 100),
(1, 'Quesadilla', 40, 80),
(2, 'Cheeseburger', 70, 120),
(2, 'Papas fritas', 30, 150);

-- orders
-- Nota: order_id conserva los valores originales del CSV (no usa IDENTITY)
INSERT INTO orders (order_id, foodtruck_id, order_date, status, total)
VALUES
(1001, 1, '2023-09-01', 'entregado', 90),
(1002, 2, '2023-09-01', 'pendiente', 100);

-- order_items
-- Nota: product_id traducido según el orden de inserción en products
-- (101->1 Taco al pastor, 102->2 Quesadilla, 103->3 Cheeseburger, 104->4 Papas fritas)
INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES
(1, 1001, 1, 1),
(2, 1002, 3, 1),
(3, 1002, 4, 1);

-- locations
INSERT INTO locations (location_id, foodtruck_id, location_date, zone)
VALUES
(1, 1, '2023-09-01', 'Centro'),
(2, 2, '2023-09-01', 'Parque');