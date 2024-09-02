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