-- ══════════════════════════════════════════
-- Pre-entrega 4 — Consultas SQL de negocio
-- Proyecto: RetailPro · Base: Ventas_Tech_DB
-- Motor: SQL Server 2025
-- Autor: Cristian Berlingieri
-- Fecha: 2026-11-06
-- Requiere: base creada en RetailPro/modulo3/ventas_tech_db.sql
-- ══════════════════════════════════════════
USE Ventas_Tech_DB;

-- Consulta 1 — Resumen ejecutivo mensual
-- Agrupa por mes y calcula facturación total, cantidad de pedidos y ticket promedio.
SELECT   MONTH(fecha_venta) AS mes,
         SUM(cantidad * precio_unitario) AS total_facturado,
         COUNT(*) AS Cantidad_de_Pedidos,
         CAST (AVG(cantidad * precio_unitario) AS DECIMAL (10, 2)) AS ticket_promedio
FROM     ventas
GROUP BY MONTH(fecha_venta);

-- Consulta 2 — Ranking de productos 
-- Rankea los 5 productos con mayor facturación, con unidades vendidas y total generado.
SELECT   TOP 5 id_producto,
               SUM(cantidad) AS unidades_vendidas,
               SUM(cantidad * precio_unitario) AS total_generado
FROM     ventas
GROUP BY id_producto
ORDER BY total_generado DESC;

-- Consulta 3 — Clientes recurrentes 
-- Lista los clientes con más de un pedido, con cantidad de pedidos y total gastado.
SELECT   id_cliente,
         COUNT(*) AS cantidad_de_pedidos,
         SUM(cantidad * precio_unitario) AS total_gastado
FROM     ventas
GROUP BY id_cliente
HAVING   COUNT(*) > 1;

-- Consulta 4 — Productos por encima/por debajo del promedio
-- Compara el total de cada producto contra el promedio de los totales por producto y lo etiqueta.
WITH     totales
AS       (SELECT   id_producto,
                   SUM(cantidad * precio_unitario) AS total_producto
          FROM     ventas
          GROUP BY id_producto)
SELECT   id_producto,
         total_producto,
         CASE WHEN total_producto > (SELECT CAST (AVG(total_producto) AS DECIMAL (10, 2))
                                     FROM   totales) THEN 'Por encima' ELSE 'Por debajo' END AS posicion
FROM     totales
ORDER BY total_producto DESC;


-- === HALLAZGOS ===
-- 1. En marzo 2024 se facturaron $6.444,00 en 10 pedidos, con un ticket promedio de $644,40.
-- 2. El producto 1 concentra el 55,9% de la facturación ($3.600) y, junto con el producto 3 (20,9%), son los únicos 2 de 6 que superan el promedio de $1.074 por producto.
-- 3. Los 5 clientes son recurrentes (2 pedidos cada uno); el cliente 1 concentra el 41,0% del total ($2.640).
-- 4. El producto 2 lidera las unidades vendidas (13), pero solo aporta el 5,6% de la facturación ($364).