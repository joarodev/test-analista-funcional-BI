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