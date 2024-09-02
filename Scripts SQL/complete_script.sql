DROP DATABASE IF EXISTS sales_management_system;
CREATE DATABASE IF NOT EXISTS sales_management_system;

USE sales_management_system;

-- Desarrollo tabla usuarios
DROP TABLE IF EXISTS user;

CREATE TABLE
    IF NOT EXISTS user (
        user_id INT AUTO_INCREMENT COMMENT "id user",
        first_name VARCHAR(25) NOT NULL COMMENT "name user",
        last_name VARCHAR(25) NOT NULL COMMENT "last name user",
        email VARCHAR(100) NOT NULL COMMENT "email user",
        phone INT COMMENT "phone user",
        role ENUM ('vendedor', 'admin') NOT NULL COMMENT "role user",
        CONSTRAINT `pk_user` PRIMARY KEY (user_id) COMMENT "primary key"
    ) COMMENT "table user" ENGINE = InnoDB AUTO_INCREMENT = 1;

-- Desarrollo tabla customer
DROP TABLE IF EXISTS customer;

CREATE TABLE
    IF NOT EXISTS customer (
        customer_id INT AUTO_INCREMENT COMMENT "id customer",
        first_name VARCHAR(25) NOT NULL COMMENT "name customer",
        last_name VARCHAR(25) NOT NULL COMMENT "last name customer",
        email VARCHAR(100) NOT NULL COMMENT "email customer",
        phone INT NOT NULL COMMENT "pohne customer",
        address VARCHAR(40) NOT NULL COMMENT "address customer",
        country VARCHAR(15) NOT NULL COMMENT "country customer",
        CONSTRAINT `pk_customer` PRIMARY KEY (customer_id) COMMENT "primary key"
    ) COMMENT "table customer" ENGINE = InnoDB AUTO_INCREMENT = 1;

-- desarrollo tabla sale order
DROP TABLE IF EXISTS sale_order;

CREATE TABLE
    IF NOT EXISTS sale_order (
        order_id INT AUTO_INCREMENT COMMENT "id order",
        order_date DATETIME NOT NULL COMMENT "order date",
        status ENUM('pendiente', 'completada', 'cancelada') NOT NULL COMMENT "status order",
        total_amount INT NOT NULL COMMENT "order total amount",
        user_id INT COMMENT "user id fk",
        customer_id INT COMMENT "customer id fk",
        CONSTRAINT `pk_sale_order` PRIMARY KEY (order_id) COMMENT "primary key"
    ) COMMENT "table sale order" ENGINE = InnoDB AUTO_INCREMENT = 1;

-- desarrollo tabla payment
DROP TABLE IF EXISTS payment;

CREATE TABLE
    IF NOT EXISTS payment (
        payment_id INT AUTO_INCREMENT COMMENT "id payment",
        payment_date DATETIME NOT NULL COMMENT "date payment",
        amount INT NOT NULL COMMENT "amount payment",
        method ENUM (
            'tarjeta de credito',
            'transferencia bancaria',
            'efectivo'
        ) NOT NULL COMMENT "method payment",
        status_payment ENUM ('pagado', 'fallido', 'pendiente') NOT NULL COMMENT "status payment",
        payment_installment ENUM ('parcial', 'total') COMMENT "installment payment",
        CONSTRAINT `pk_payment` PRIMARY KEY (payment_id) COMMENT "primary key"
    ) COMMENT "table payment" ENGINE = InnoDB AUTO_INCREMENT = 1;

-- desarrollo tabla invoice
DROP TABLE IF EXISTS invoice;

CREATE TABLE
    IF NOT EXISTS invoice (
        invoice_id INT AUTO_INCREMENT COMMENT "invoice id",
        invoice_date DATETIME NOT NULL COMMENT "invoice datetime",
        total_amount DECIMAL(10, 2) NOT NULL COMMENT "total amount invoice",
        due_date DATETIME,
        status_invoice ENUM ('pagada', 'pendiente', 'vencida') NOT NULL COMMENT "status invoice",
        payment_id INT COMMENT "payment id fk",
        order_id INT COMMENT "sale_order_id id fk",
        product_id INT COMMENT "product id fk",
        CONSTRAINT `pk_invoice` PRIMARY KEY (invoice_id) COMMENT "primary key"
    ) COMMENT "table invoice" ENGINE = InnoDB AUTO_INCREMENT = 1;

-- desarrollo tabla category
DROP TABLE IF EXISTS category;

CREATE TABLE
    IF NOT EXISTS category (
        category_id INT AUTO_INCREMENT COMMENT "id_category",
        name VARCHAR(100) NOT NULL COMMENT "name category",
        description VARCHAR(250) NOT NULL COMMENT "description category",
        CONSTRAINT `pk_category` PRIMARY KEY (category_id) COMMENT "primary key"
    ) COMMENT "table category" ENGINE = InnoDB AUTO_INCREMENT = 1;

-- desarrollo tabla producto
DROP TABLE IF EXISTS product;

CREATE TABLE
    IF NOT EXISTS product (
        product_id INT AUTO_INCREMENT COMMENT "id product",
        name VARCHAR(100) NOT NULL COMMENT "name product",
        price DECIMAL(10, 2) NOT NULL COMMENT "price product",
        category_id INT COMMENT "category id fk",
        CONSTRAINT `pk_product` PRIMARY KEY (product_id) COMMENT "primary key"
    ) COMMENT "table products" ENGINE = InnoDB AUTO_INCREMENT = 1;

-- Foreign keys
ALTER TABLE `sale_order` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `sale_order` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

ALTER TABLE `product` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

ALTER TABLE `invoice` ADD FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`);

ALTER TABLE `invoice` ADD FOREIGN KEY (`order_id`) REFERENCES `sale_order` (`order_id`);

ALTER TABLE `invoice` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

-- Insertar datos en la tabla user
INSERT INTO
    user (first_name, last_name, email, phone, role)
VALUES
    (
        'Ana',
        'García',
        'ana.garcia@example.com',
        123456789,
        'vendedor'
    ),
    (
        'Luis',
        'Martínez',
        'luis.martinez@example.com',
        234567890,
        'vendedor'
    ),
    (
        'Marta',
        'Sánchez',
        'marta.sanchez@example.com',
        345678901,
        'admin'
    ),
    (
        'Jorge',
        'Rodríguez',
        'jorge.rodriguez@example.com',
        456789012,
        'vendedor'
    ),
    (
        'Laura',
        'López',
        'laura.lopez@example.com',
        567890123,
        'vendedor'
    ),
    (
        'Carlos',
        'Fernández',
        'carlos.fernandez@example.com',
        678901234,
        'admin'
    ),
    (
        'Isabel',
        'Gómez',
        'isabel.gomez@example.com',
        789012345,
        'vendedor'
    ),
    (
        'Pedro',
        'Martín',
        'pedro.martin@example.com',
        890123456,
        'vendedor'
    ),
    (
        'Beatriz',
        'Pérez',
        'beatriz.perez@example.com',
        901234567,
        'admin'
    ),
    (
        'Raúl',
        'Jiménez',
        'raul.jimenez@example.com',
        123456789,
        'vendedor'
    );

-- Insertar datos en la tabla customer
INSERT INTO
    customer (
        first_name,
        last_name,
        email,
        phone,
        address,
        country
    )
VALUES
    (
        'Luis',
        'Pérez',
        'luis.perez@example.com',
        111223344,
        'Calle 1, Madrid',
        'España'
    ),
    (
        'Carmen',
        'López',
        'carmen.lopez@example.com',
        222334455,
        'Calle 2, Barcelona',
        'España'
    ),
    (
        'José',
        'Ramírez',
        'jose.ramirez@example.com',
        333445566,
        'Calle 3, Valencia',
        'España'
    ),
    (
        'Ana',
        'Hernández',
        'ana.hernandez@example.com',
        444556677,
        'Calle 4, Sevilla',
        'España'
    ),
    (
        'María',
        'Martín',
        'maria.martin@example.com',
        555667788,
        'Calle 5, Bilbao',
        'España'
    ),
    (
        'Carlos',
        'González',
        'carlos.gonzalez@example.com',
        666778899,
        'Calle 6, Zaragoza',
        'España'
    ),
    (
        'Laura',
        'Serrano',
        'laura.serrano@example.com',
        777889900,
        'Calle 7, Málaga',
        'España'
    ),
    (
        'Fernando',
        'Vázquez',
        'fernando.vazquez@example.com',
        888990011,
        'Calle 8, Alicante',
        'España'
    ),
    (
        'Dolores',
        'Moreno',
        'dolores.moreno@example.com',
        999001122,
        'Calle 9, Murcia',
        'España'
    ),
    (
        'Sergio',
        'Alonso',
        'sergio.alonso@example.com',
        101112131,
        'Calle 10, Valladolid',
        'España'
    );

-- Insertar datos en la tabla sale_order (con 2-4 ventas por usuario)
INSERT INTO
    sale_order (
        order_date,
        status,
        total_amount,
        user_id,
        customer_id
    )
VALUES
    -- Ventas del usuario 1
    ('2024-08-01 10:00:00', 'completada', 150, 1, 1),
    ('2024-08-02 11:00:00', 'completada', 200, 1, 2),
    -- Ventas del usuario 2
    ('2024-08-03 12:00:00', 'completada', 250, 2, 3),
    ('2024-08-04 13:00:00', 'pendiente', 300, 2, 4),
    -- Ventas del usuario 3
    ('2024-08-05 14:00:00', 'completada', 350, 3, 5),
    -- Ventas del usuario 4
    ('2024-08-06 15:00:00', 'completada', 400, 4, 6),
    ('2024-08-07 16:00:00', 'completada', 450, 4, 7),
    -- Ventas del usuario 5
    ('2024-08-08 17:00:00', 'completada', 500, 5, 8),
    ('2024-08-09 18:00:00', 'pendiente', 550, 5, 9),
    -- Ventas del usuario 6
    ('2024-08-10 19:00:00', 'completada', 600, 6, 10),
    -- Ventas del usuario 7
    ('2024-08-11 20:00:00', 'completada', 250, 7, 1),
    ('2024-08-12 21:00:00', 'pendiente', 300, 7, 2),
    -- Ventas del usuario 8
    ('2024-08-13 22:00:00', 'completada', 350, 8, 3),
    ('2024-08-14 23:00:00', 'completada', 400, 8, 4),
    -- Ventas del usuario 9
    ('2024-08-15 00:00:00', 'completada', 450, 9, 5),
    ('2024-08-16 23:00:00', 'completada', 500, 9, 6),
    -- Ventas del usuario 10
    ('2024-08-17 21:00:00', 'completada', 550, 10, 7);

-- Insertar datos en la tabla payment
INSERT INTO
    payment (
        payment_date,
        amount,
        method,
        status_payment,
        payment_installment
    )
VALUES
    -- Pagos correspondientes a las ventas anteriores
    (
        '2024-08-01 10:00:00',
        150,
        'tarjeta de credito',
        'pagado',
        'total'
    ),
    (
        '2024-08-02 11:00:00',
        200,
        'transferencia bancaria',
        'pagado',
        'total'
    ),
    (
        '2024-08-03 12:00:00',
        250,
        'efectivo',
        'pagado',
        'total'
    ),
    (
        '2024-08-04 13:00:00',
        300,
        'tarjeta de credito',
        'pendiente',
        'total'
    ),
    (
        '2024-08-05 14:00:00',
        350,
        'transferencia bancaria',
        'pagado',
        'total'
    ),
    (
        '2024-08-06 15:00:00',
        400,
        'efectivo',
        'pagado',
        'total'
    ),
    (
        '2024-08-07 16:00:00',
        450,
        'tarjeta de credito',
        'pagado',
        'total'
    ),
    (
        '2024-08-08 17:00:00',
        500,
        'transferencia bancaria',
        'pagado',
        'total'
    ),
    (
        '2024-08-09 18:00:00',
        550,
        'efectivo',
        'pendiente',
        'total'
    ),
    (
        '2024-08-10 19:00:00',
        600,
        'tarjeta de credito',
        'pagado',
        'total'
    ),
    (
        '2024-08-11 20:00:00',
        250,
        'transferencia bancaria',
        'pagado',
        'total'
    ),
    (
        '2024-08-12 21:00:00',
        300,
        'efectivo',
        'pendiente',
        'total'
    ),
    (
        '2024-08-13 22:00:00',
        350,
        'tarjeta de credito',
        'pagado',
        'total'
    ),
    (
        '2024-08-14 23:00:00',
        400,
        'transferencia bancaria',
        'pagado',
        'total'
    ),
    (
        '2024-08-15 00:00:00',
        450,
        'efectivo',
        'pagado',
        'total'
    ),
    (
        '2024-08-16 23:00:00',
        500,
        'tarjeta de credito',
        'pagado',
        'total'
    ),
    (
        '2024-08-17 21:00:00',
        550,
        'transferencia bancaria',
        'pagado',
        'total'
    );

-- Insertar datos en la tabla category
INSERT INTO
    category (name, description)
VALUES
    (
        'Electrónica',
        'Dispositivos electrónicos como teléfonos, computadoras, etc.'
    ),
    ('Muebles', 'Muebles para el hogar y oficina.'),
    ('Ropa', 'Ropa y accesorios de moda.'),
    ('Deportes', 'Equipos y accesorios deportivos.'),
    ('Hogar', 'Artículos para el hogar y jardín.'),
    ('Juguetes', 'Juguetes y juegos para niños.'),
    ('Alimentos', 'Productos alimenticios y bebidas.'),
    (
        'Libros',
        'Libros de diferentes géneros y autores.'
    ),
    ('Salud', 'Productos de cuidado personal y salud.'),
    (
        'Automóviles',
        'Accesorios y repuestos para automóviles.'
    );

-- Insertar datos en la tabla product
INSERT INTO
    product (name, price, category_id)
VALUES
    ('Smartphone', 299.99, 1),
    ('Laptop', 999.99, 1),
    ('Sofá', 499.99, 2),
    ('Silla de Oficina', 149.99, 2),
    ('Camisa', 29.99, 3),
    ('Zapatos', 59.99, 3),
    ('Pelota de Fútbol', 25.99, 4),
    ('Raqueta de Tenis', 89.99, 4),
    ('Sofá Cama', 349.99, 2),
    ('Mesa de Comedor', 199.99, 2),
    ('Gafas de Sol', 89.99, 3),
    ('Chaqueta', 119.99, 3),
    ('Bicicleta', 499.99, 4),
    ('Zapatillas Running', 79.99, 4),
    ('Tenedor', 9.99, 5),
    ('Sarten', 39.99, 5),
    ('Juguete de Construcción', 24.99, 6),
    ('Muñeca', 19.99, 6),
    ('Papel de Regalo', 4.99, 7),
    ('Café', 12.99, 7);

-- Insertar datos en la tabla invoice
INSERT INTO
    invoice (
        invoice_date,
        total_amount,
        due_date,
        status_invoice,
        payment_id,
        order_id,
        product_id
    )
VALUES
    (
        '2024-08-01 10:00:00',
        299.99,
        '2024-08-15',
        'pagada',
        1,
        1,
        1
    ), -- Smartphone
    (
        '2024-08-02 11:00:00',
        999.99,
        '2024-08-16',
        'pagada',
        2,
        2,
        2
    ), -- Laptop
    (
        '2024-08-03 12:00:00',
        499.99,
        '2024-08-17',
        'pagada',
        3,
        3,
        3
    ), -- Sofá
    (
        '2024-08-04 13:00:00',
        149.99,
        '2024-08-18',
        'pendiente',
        4,
        4,
        4
    ), -- Silla de Oficina
    (
        '2024-08-05 14:00:00',
        119.99,
        '2024-08-19',
        'pagada',
        5,
        5,
        13
    ), -- Chaqueta
    (
        '2024-08-06 15:00:00',
        349.99,
        '2024-08-20',
        'pagada',
        6,
        6,
        9
    ), -- Sofá Cama
    (
        '2024-08-07 16:00:00',
        199.99,
        '2024-08-21',
        'pagada',
        7,
        7,
        10
    ), -- Mesa de Comedor
    (
        '2024-08-08 17:00:00',
        499.99,
        '2024-08-22',
        'pagada',
        8,
        8,
        14
    ), -- Bicicleta
    (
        '2024-08-09 18:00:00',
        79.99,
        '2024-08-23',
        'pendiente',
        9,
        9,
        15
    ), -- Zapatillas Running
    (
        '2024-08-10 19:00:00',
        39.99,
        '2024-08-24',
        'pagada',
        10,
        10,
        16
    ), -- Sarten
    (
        '2024-08-11 20:00:00',
        24.99,
        '2024-08-25',
        'pagada',
        11,
        11,
        17
    ), -- Juguete de Construcción
    (
        '2024-08-12 21:00:00',
        19.99,
        '2024-08-26',
        'pendiente',
        12,
        12,
        18
    ), -- Muñeca
    (
        '2024-08-13 22:00:00',
        4.99,
        '2024-08-27',
        'pagada',
        13,
        13,
        19
    ), -- Papel de Regalo
    (
        '2024-08-14 23:00:00',
        12.99,
        '2024-08-28',
        'pagada',
        14,
        14,
        20
    ), -- Café
    (
        '2024-08-15 00:00:00',
        299.99,
        '2024-08-29',
        'pagada',
        15,
        15,
        1
    ), -- Smartphone
    (
        '2024-08-16 23:00:00',
        999.99,
        '2024-08-30',
        'pagada',
        16,
        16,
        2
    ), -- Laptop
    (
        '2024-08-17 21:00:00',
        499.99,
        '2024-08-31',
        'pagada',
        17,
        17,
        3
    );

-- Sofá

-- Simulación de vistas materializadas (mysql no tiene nativas)

-- Cantidad de Ventas y Productos Más Vendidos:
DROP VIEW IF EXISTS VW_sales_and_products;
CREATE VIEW VW_sales_and_products AS
SELECT
    COUNT(DISTINCT o.order_id) AS total_sales,
    p.name AS producto,
    COUNT(p.product_id) AS quantity_sales
FROM
    sale_order o
    JOIN invoice i ON o.order_id = i.invoice_id
    JOIN product p ON i.product_id = p.product_id
GROUP BY
    p.product_id,
    p.name
ORDER BY
    quantity_sales DESC;

-- Monto Facturado y Estado de los Pagos:
DROP VIEW IF EXISTS VW_invoice_and_payments;
CREATE VIEW VW_invoice_and_payments AS
SELECT
    i.invoice_id AS total_invoice_amount,
    i.total_amount AS total_amount,
    p.amount AS amount_payment,
    p.status_payment AS status
FROM
    invoice i
    JOIN payment p ON i.payment_id = p.payment_id
GROUP BY
    i.invoice_id,
    i.total_amount,
    amount_payment,
    status;

-- comparativa de ventas y pagos recibidos
DROP VIEW IF EXISTS VW_sales_and_payments;
CREATE VIEW VW_sales_and_payments AS
SELECT
    i.invoice_id,
    i.total_amount AS invoice_amount,
    i.status_invoice,
    p.status_payment,
    so.status AS order_status
FROM invoice i
JOIN sale_order so ON i.order_id = so.order_id
LEFT JOIN payment p ON i.payment_id = p.payment_id


-- Ranking de usuarios por ventas
DROP VIEW IF EXISTS VW_user_sales_ranking;
CREATE VIEW VW_user_sales_ranking AS
SELECT u.user_id,
       CONCAT(u.first_name, ' ', u.last_name) AS name_user,
       COUNT(o.order_id)                      AS number_of_sales
FROM user u
         JOIN sale_order o ON u.user_id = o.user_id
GROUP BY u.user_id,
         u.first_name,
         u.last_name
ORDER BY number_of_sales DESC;

-- Detalle de Ventas y Facturas
DROP VIEW IF EXISTS VW_sales_and_invoices;
CREATE VIEW VW_sales_and_invoices AS
SELECT
    so.order_id,
    so.status AS order_status,
    i.invoice_date,
    i.total_amount AS invoice_total_amount,
    i.status_invoice,
    i.due_date,
    p.payment_id,
    p.payment_date,
    p.amount AS payment_amount,
    p.method AS payment_method,
    p.status_payment,
    pr.name AS product_name,
    pr.price AS product_price
FROM sale_order so
LEFT JOIN invoice i ON so.order_id = i.order_id
LEFT JOIN payment p ON i.payment_id = p.payment_id
LEFT JOIN product pr ON i.product_id = pr.product_id
ORDER BY so.order_id, i.invoice_id;

DROP DATABASE IF EXISTS data_warehouse;
CREATE DATABASE IF NOT EXISTS data_warehouse;

USE data_warehouse;

-- Tables views
DROP TABLE IF EXISTS sales_and_products_dw;
CREATE TABLE IF NOT EXISTS sales_and_products_dw (
    total_sales DECIMAL(10,2),
    product VARCHAR(50),
    quantity_sales iNT
);

DROP TABLE IF EXISTS invoice_and_payments_dw;
CREATE TABLE IF NOT EXISTS invoice_and_payments_dw (
    total_invoice_amount DECIMAL(10, 2),
    total_amount DECIMAL(10, 2),
    amount_payment DECIMAL(10, 2),
    status VARCHAR(50)
);

DROP TABLE IF EXISTS sales_and_payments_dw;
CREATE TABLE IF NOT EXISTS sales_and_payments_dw(
    invoice_id INT,
    invoice_amount DECIMAL(10, 2),
    status_invoice VARCHAR(50),
    status_payment VARCHAR(50),
    order_status VARCHAR(50)
);

DROP TABLE IF EXISTS user_sales_ranking_dw;
CREATE TABLE IF NOT EXISTS user_sales_ranking_dw(
    user_id INT,
    name_user VARCHAR(50),
    number_of_sales INT
);

DROP TABLE IF EXISTS sales_and_invoices_dw;
CREATE TABLE IF NOT EXISTS sales_and_invoices_dw(
    order_id INT,
    order_status VARCHAR(15),
    invoice_date DATETIME,
    invoice_total_amount DECIMAL(10, 2),
    status_invoice ENUM('pagada', 'pendiente', 'vencida'),
    due_date DATETIME,
    payment_id INT,
    payment_date DATETIME,
    payment_amount INT,
    payment_method ENUM('tarjeta de credito','transferencia bancaria','efectivo'),
    status_payment ENUM('pagado', 'fallido', 'pendiente'),
    product_name VARCHAR(50),
    product_price DECIMAL(10,2)
);

USE sales_management_system;

 -- Insertar datos nuevos

INSERT INTO data_warehouse.sales_and_products_dw
SELECT * FROM VW_sales_and_products;

INSERT INTO data_warehouse.invoice_and_payments_dw
SELECT * FROM VW_invoice_and_payments;

INSERT INTO data_warehouse.sales_and_payments_dw
SELECT * FROM VW_sales_and_payments;

INSERT INTO data_warehouse.user_sales_ranking_dw
SELECT * FROM VW_user_sales_ranking;

INSERT INTO data_warehouse.sales_and_invoices_dw
SELECT * FROM VW_sales_and_invoices;

-- Procedimiento para recrear vistas automaticamente

DELIMITER $$
CREATE PROCEDURE SP_refresh_views()
BEGIN
    -- Eliminar vistas
    DROP VIEW IF EXISTS VW_sales_and_products;
    DROP VIEW IF EXISTS VW_invoice_and_payments;
    DROP VIEW IF EXISTS VW_sales_and_payments;
    DROP VIEW IF EXISTS VW_user_sales_ranking;
    DROP VIEW IF EXISTS VW_sales_and_invoices;

    -- Crear vistas

    -- Cantidad de Ventas y Productos Más Vendidos:
    CREATE VIEW VW_sales_and_products AS
    SELECT
        COUNT(DISTINCT o.order_id) AS total_sales,
        p.name AS producto,
        COUNT(p.product_id) AS quantity_sales
    FROM
        sale_order o
        JOIN invoice i ON o.order_id = i.invoice_id
        JOIN product p ON i.product_id = p.product_id
    GROUP BY
        p.product_id,
        p.name
    ORDER BY
        quantity_sales DESC;

    -- Monto Facturado y Estado de los Pagos:
    CREATE VIEW VW_invoice_and_payments AS
    SELECT
        i.invoice_id AS total_invoice_amount,
        i.total_amount AS total_amount,
        p.amount AS amount_payment,
        p.status_payment AS status
    FROM
        invoice i
        JOIN payment p ON i.payment_id = p.payment_id
    GROUP BY
        i.invoice_id,
        i.total_amount,
        amount_payment,
        status;

    -- comparativa de ventas y pagos recibidos
    CREATE VIEW VW_sales_and_payments AS
    SELECT
        i.invoice_id,
        i.total_amount AS invoice_amount,
        i.status_invoice,
        p.status_payment,
        so.status AS order_status
    FROM invoice i
    JOIN sale_order so ON i.order_id = so.order_id
    LEFT JOIN payment p ON i.payment_id = p.payment_id;


    -- Ranking de usuarios por ventas
    CREATE VIEW VW_user_sales_ranking AS
    SELECT u.user_id,
        CONCAT(u.first_name, ' ', u.last_name) AS name_user,
        COUNT(o.order_id)                      AS number_of_sales
    FROM user u
            JOIN sale_order o ON u.user_id = o.user_id
    GROUP BY u.user_id,
            u.first_name,
            u.last_name
    ORDER BY number_of_sales DESC;

    -- Detalle de Ventas y Facturas
    CREATE VIEW sales_and_invoices AS
    SELECT
        so.order_id,
        so.status AS order_status,
        i.invoice_date,
        i.total_amount AS invoice_total_amount,
        i.status_invoice,
        i.due_date,
        p.payment_id,
        p.payment_date,
        p.amount AS payment_amount,
        p.method AS payment_method,
        p.status_payment,
        pr.name AS product_name,
        pr.price AS product_price
    FROM sale_order so
    LEFT JOIN invoice i ON so.order_id = i.order_id
    LEFT JOIN payment p ON i.payment_id = p.payment_id
    LEFT JOIN product pr ON i.product_id = pr.product_id
    ORDER BY so.order_id, i.invoice_id;
END $$
DELIMITER ;

-- Evento programado para recrear las vistas

SET GLOBAL event_scheduler = ON;

CREATE EVENT IF NOT EXISTS refresh_views_event
ON SCHEDULE EVERY 1 DAY
STARTS '2024-09-01 00:00:00'
DO
CALL SP_refresh_views();

-- Procedimiento para transferir datos al data warehouse

DELIMITER //
CREATE PROCEDURE SP_transfer_data_to_data_warehouse()
BEGIN
    -- Limpiar datos anteriores
    TRUNCATE TABLE data_warehouse.sales_and_products_dw;
    TRUNCATE TABLE data_warehouse.invoice_and_payments_dw;
    TRUNCATE TABLE data_warehouse.sales_and_payments_dw;
    TRUNCATE TABLE data_warehouse.user_sales_ranking_dw;
    TRUNCATE TABLE data_warehouse.sales_and_invoices_dw;

    -- Insertar datos nuevos

    INSERT INTO data_warehouse.sales_and_products_dw
    SELECT * FROM VW_sales_and_products;

    INSERT INTO data_warehouse.invoice_and_payments_dw
    SELECT * FROM VW_invoice_and_payments;

    INSERT INTO data_warehouse.sales_and_payments_dw
    SELECT * FROM VW_sales_and_payments;

    INSERT INTO data_warehouse.user_sales_ranking_dw
    SELECT * FROM VW_user_sales_ranking;

    INSERT INTO data_warehouse.sales_and_invoices_dw
    SELECT * FROM VW_sales_and_invoices;

END //
DELIMITER ;

-- Evento programado para transferir datos al data warehouse

SET GLOBAL event_scheduler = ON;

CREATE EVENT IF NOT EXISTS transfer_data_to_data_warehouse_event
ON SCHEDULE EVERY 1 DAY
STARTS '2024-09-01 00:00:00'
DO
CALL SP_transfer_data_to_data_warehouse();