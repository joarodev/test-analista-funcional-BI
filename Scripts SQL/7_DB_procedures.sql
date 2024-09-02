USE sales_management_system;

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
    LEFT JOIN payment p ON i.payment_id = p.payment_id


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