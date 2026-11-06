# Data Analytics — Prácticas

Repositorio con los scripts y entregables del curso Data Scientist (Coderhouse), resueltos para **Microsoft SQL Server 2025**.

## Proyecto RetailPro

Proyecto final del curso: dashboard de inteligencia de negocios sobre una cadena de retail de tecnología. La base `Ventas_Tech_DB` es el back-end que se usa en los módulos 5 a 8.

| Módulo | Script | Descripción |
|---|---|---|
| 3 | [`RetailPro/modulo3/ventas_tech_db.sql`](RetailPro/modulo3/ventas_tech_db.sql) | Esquema normalizado (3NF) de `Ventas_Tech_DB`: categorías, clientes, productos y ventas, con 25 registros iniciales. |
| 4 | [`RetailPro/modulo4/m4_consultas_negocio.sql`](RetailPro/modulo4/m4_consultas_negocio.sql) | Consultas de negocio sobre `Ventas_Tech_DB`: resumen mensual, ranking de productos, clientes recurrentes y comparación con el promedio. |

## Prácticas de clase

| Módulo | Script | Descripción |
|---|---|---|
| 2 — Unidad 1 | [`practicas/modulo2/modulo2_unidad1_diseno.sql`](practicas/modulo2/modulo2_unidad1_diseno.sql) | Diseño de las tablas `clientes` y `productos` (DDL). |
| 3 | [`practicas/modulo3/ddl_dml_bodega.sql`](practicas/modulo3/ddl_dml_bodega.sql) | DDL y DML del inventario de BodegaTech: tabla `inventario` con 10 productos, ventas y baja lógica. |

## Estructura del repositorio

```
.
├── RetailPro/
│   ├── modulo3/
│   │   └── ventas_tech_db.sql
│   └── modulo4/
│       └── m4_consultas_negocio.sql
├── practicas/
│   ├── modulo2/
│   │   └── modulo2_unidad1_diseno.sql
│   └── modulo3/
│       └── ddl_dml_bodega.sql
└── README.md
```

## Cómo ejecutar

1. Contar con un servidor SQL Server (en este proyecto se usa la imagen oficial en Docker, `mcr.microsoft.com/mssql/server:2025-latest`).
2. Abrir el script en VS Code con la extensión **SQL Server (mssql)** — o en SQL Server Management Studio — y conectarse al servidor.
3. Ejecutar el archivo completo.

## Notas

- Los scripts son **repetibles**: eliminan las tablas con `DROP TABLE IF EXISTS` en orden inverso a las dependencias antes de crearlas.
- `ventas_tech_db.sql` crea la base `Ventas_Tech_DB` solo si no existe (`IF DB_ID(...) IS NULL`) y se posiciona en ella con `USE`.
- Los importes se almacenan con `DECIMAL(10,2)` (nunca `FLOAT`) para evitar errores de redondeo en las agregaciones.
- `ventas_tech_db.sql` incluye `CHECK` constraints que impiden precios y stock negativos y cantidades no positivas (`cantidad > 0`).
