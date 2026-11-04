-- ══════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: Cristian Berlingieri
-- Fecha: 2026-10-30
-- ══════════════════════════════════════════
-- ── SECCIÓN DDL ──────────────────────────
-- DROP TABLE
DROP TABLE IF EXISTS inventario;

-- CREATE TABLE
CREATE TABLE inventario (
    --SE UTILIZA INT PORQUE EL id ES SIEMPRE UN NUMERO ENTERO.
    id_producto     INT             IDENTITY (1, 1) PRIMARY KEY,
    --SE UTILIZA VARCHAR(100) PARA ESCRIBIR EL NOMBRE DEL PRODUCTO HASTA CON 100 CARACTERES.
    nombre_producto VARCHAR (100)   NOT NULL,
    --SE UTILIZA VARCHAR(50) PARA ESCRIBIR LA CATEGORIA HASTA CON 50 CARACTERES.
    categoria       VARCHAR (50)    NOT NULL,
    --SE UTILIZA DECIMAL(10,2) PARA UN PRECIO YA QUE NOS PERMITE AGREGAR HASTA 10 DIGITOS Y 2 DE ELLOS DECIMALES, HASTA 99.999.999,99.
    precio_unitario DECIMAL (10, 2) NOT NULL,
    --SE UTILIZA INT PARA NUMERAR STOCK, YA QUE SIEMPRE VA A SER UN ENTERO, UN STOCK NO SE PUEDE PARTIR EN DECIMALES.
    stock_actual    INT             NOT NULL,
    --SE UTILIZA INT PARA NUMERAR STOCK, YA QUE SIEMPRE VA A SER UN ENTERO, UN STOCK NO SE PUEDE PARTIR EN DECIMALES.
    stock_minimo    INT             NOT NULL,
    --SE UTILIZA DATE PORQUE NOS VA A FACILITAR LA FECHA DE INGRESO, SIN NECESIDAD DE HORARIOS NI DATOS DE MÁS.
    fecha_ingreso   DATE            NOT NULL,
    --SE UTILIZA TINYINT PARA UTILIZAR 0 Y 1 YA QUE NOS FACILITA QUE SEAN 2 NUMEROS PARA IDENTIFICAR ACTIVO Y NO ACTIVO.
    activo          TINYINT         CHECK (activo IN (0, 1)) NOT NULL
);

-- ── SECCIÓN DML ──────────────────────────
-- INSERT INTO 
INSERT  INTO inventario (
    nombre_producto,
    categoria,
    precio_unitario,
    stock_actual,
    stock_minimo,
    fecha_ingreso,
    activo
)
VALUES                  ('Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
                        ('Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
                        ('Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
                        ('Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
                        ('Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
                        ('Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
                        ('Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
                        ('Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
                        ('SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
                        ('Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

-- UPDATE ventas del día
UPDATE inventario
SET    stock_actual = stock_actual - 3
WHERE  id_producto = 1;

UPDATE inventario
SET    stock_actual = stock_actual - 12
WHERE  id_producto = 2;

UPDATE inventario
SET    stock_actual = stock_actual - 5
WHERE  id_producto = 6;

-- UPDATE producto descontinuado
UPDATE inventario
SET    activo = 0
WHERE  id_producto = 8;

-- SELECT validaciones
SELECT *
FROM   inventario;