-- FoodTrack DB - Evolucion del esquema
-- Se agrega la columna 'comentarios' a la tabla orders, para permitir
-- observaciones del cliente o del foodtruck sobre el pedido.

USE FoodTrack_DB;
GO

ALTER TABLE orders
ADD comentarios NVARCHAR(255);

UPDATE orders SET comentarios = 'Sin cebolla' WHERE order_id = 1001;
UPDATE orders SET comentarios = 'Pedido para retirar rapido' WHERE order_id = 1002;
