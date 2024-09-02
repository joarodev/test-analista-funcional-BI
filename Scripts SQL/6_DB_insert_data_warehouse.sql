USE sales_management_system;

-- Insertar datos nuevos
INSERT INTO
    data_warehouse.sales_and_products_dw
SELECT
    *
FROM
    VW_sales_and_products;

INSERT INTO
    data_warehouse.invoice_and_payments_dw
SELECT
    *
FROM
    VW_invoice_and_payments;

INSERT INTO
    data_warehouse.sales_and_payments_dw
SELECT
    *
FROM
    VW_sales_and_payments;

INSERT INTO
    data_warehouse.user_sales_ranking_dw
SELECT
    *
FROM
    VW_user_sales_ranking;

INSERT INTO
    data_warehouse.sales_and_invoices_dw
SELECT
    *
FROM
    VW_sales_and_invoices;