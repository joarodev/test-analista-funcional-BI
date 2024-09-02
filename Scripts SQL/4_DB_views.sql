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