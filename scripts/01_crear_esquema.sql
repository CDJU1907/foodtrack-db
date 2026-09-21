-- FoodTrack DB - Creación del esquema inicial

CREATE DATABASE FoodTrack_DB;
GO

USE FoodTrack_DB;
GO

CREATE TABLE foodtrucks (
    foodtruck_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    cuisine_type NVARCHAR(50) NOT NULL,
    city NVARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    foodtruck_id INT NOT NULL,
    name NVARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_Products_Foodtruck FOREIGN KEY (foodtruck_id) REFERENCES foodtrucks(foodtruck_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    foodtruck_id INT NOT NULL,
    order_date DATE NOT NULL,
    status NVARCHAR(20) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Orders_Foodtruck FOREIGN KEY (foodtruck_id) REFERENCES foodtrucks(foodtruck_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    CONSTRAINT FK_OrderItems_Order FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT FK_OrderItems_Product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    foodtruck_id INT NOT NULL,
    location_date DATE NOT NULL,
    zone NVARCHAR(100) NOT NULL,
    CONSTRAINT FK_Locations_Foodtruck FOREIGN KEY (foodtruck_id) REFERENCES foodtrucks(foodtruck_id)
);
