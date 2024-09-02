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
CREATE TABLE IF NOT EXISTS user_sales_ranking(
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