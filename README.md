# Análista funcional BI - Test Técnico.

Este proyecto consiste en la creación de un sistema de gestión de ventas que abarca la administración de usuarios, clientes, productos, órdenes de venta, facturación y pagos. Incluye una base de datos operativa y una réplica simulada como "data warehouse" para propósitos de análisis.

## Instrucciones para la Importación y Ejecución

Para una correcta importación de la base de datos y la inserción de datos, es importante ejecutar los scripts SQL en el siguiente orden:

### 1. Creación de la Base de Datos

- **Script:** `1_DB_create.sql`  
- **Descripción:**  
  Este script se encarga de eliminar la base de datos `sales_management_system` si ya existe, y crea una nueva base de datos con el mismo nombre.  
- **Propósito:**  
  Preparar el entorno inicial para crear las tablas necesarias.

### 2. Creación de Tablas

- **Script:** `2_DB_tables.sql`  
- **Descripción:**  
  El script crea las tablas necesarias (`user`, `customer`, `sale_order`, `payment`, `invoice`, `category`, `product`) en la base de datos `sales_management_system`. Si estas tablas ya existen, serán eliminadas (dropeadas) antes de ser recreadas.  
- **Propósito:**  
  Establecer la estructura de datos para almacenar información de usuarios, clientes, productos, ventas, pagos, y facturación.

### 3. Inserción de Datos Ficticios

- **Script:** `3_DB_insert_data.sql`  
- **Descripción:**  
  Inserta datos ficticios generados para cada una de las tablas en la base de datos `sales_management_system`.  
- **Propósito:**  
  Población de datos iniciales para pruebas y validaciones de las consultas requeridas.

### 4. Creación de Vistas

- **Script:** `4_DB_views.sql`  
- **Descripción:**  
  Este script crea las vistas simulando las vistas materializadas, almacenan consultas JOIN requeridas según los criterios del test técnico.  
- **Propósito:**  
  Facilitar el análisis de datos a través de vistas optimizadas que combinan varias tablas y presentan información relevante.

### 5. Creación de Base de Datos de Data Warehouse

- **Script:** `5_DB_data_warehouse.sql`  
- **Descripción:**  
  Crea una base de datos replica llamada `data_warehouse` que simula un entorno de análisis de datos, replicando la estructura de las tablas necesarias, esto es para evitar realizar las consultas directamente a la base de datos.  
- **Propósito:**  
  Establecer un data warehouse para facilitar la generación de reportes y análisis histórico.

### 6. Inserción de Datos en el Data Warehouse

- **Script:** `6_DB_insert_data_warehouse.sql`  
- **Descripción:**  
  Inserta los datos derivados de las vistas de la base de datos `sales_management_system` en las tablas del `data_warehouse`.  
- **Propósito:**  
  Transferir datos procesados y limpios de la base de datos operativa a un entorno de almacenamiento para análisis.

### 7. Procedimientos de Actualización

- **Script:** `7_DB_procedures.sql`  
- **Descripción:**  
  Define procedimientos almacenados que permiten la actualización automatizada de las vistas y la inserción de nuevos datos en las tablas del `data_warehouse`.  
- **Propósito:**  
  Automatizar la sincronización de datos entre la base de datos operativa y el data warehouse, asegurando que los datos estén actualizados para el análisis.

### 8. Ejecución Opcional: Script Completo

- **Script:** `complete_script.sql`  
- **Descripción:**  
  Este script ejecuta todas las consultas en el orden correcto, permitiendo configurar todo el sistema en un solo paso.  
- **Propósito:**  
  Facilitar el despliegue del sistema completo en entornos de desarrollo o prueba.

## Recomendaciones de Dashboard en Power BI

Una vez que los datos del `data_warehouse` se carguen en Power BI, se pueden aplicar transformaciones para mejorar la calidad de los datos, tales como:
- Limpieza de datos duplicados o inconsistentes.
- Creación de columnas calculadas para KPIs.
- Modelado de datos optimizado para visualizaciones.

### Sugerencias de Dashboards:

1. **Dashboard Cantidad de Ventas y Productos Más Vendidos:**
   - Visualizar el número total de ventas realizadas y destacar los productos con mayor demanda..

2. **Dashboard Monto Facturado y Estado de los Pagos:**
   - Monitorear el monto total facturado, junto con el desglose de los pagos y sus respectivos estados.

3. **Dashboard Comparativa de Ventas vs. Pagos Recibidos:**
   - Comparar el monto total de las ventas con el monto efectivamente pagado por los clientes.

4. **Dashboard Ranking de Usuarios por Ventas:**
   - Determinar qué usuarios han generado la mayor cantidad de ventas.

4. **Dashboard Detalle de Ventas y Facturas:**
   - Proveer un desglose detallado de cada venta y sus
correspondientes facturas.

### Realizado por [Joaquin Rodríguez](https://www.linkedin.com/in/joaquinrodriguez-dev/)
