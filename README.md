# Data Analytics — Prácticas

Repositorio con los scripts y entregables del curso Data Scientist (Coderhouse), resueltos para **Microsoft SQL Server 2025**.

## Contenido

| Módulo | Script | Descripción |
|---|---|---|
| 2 — Unidad 1 | [`modulo2_unidad1_diseno.sql`](modulo2_unidad1_diseno.sql) | Diseño de las tablas `clientes` y `productos` (DDL). |
| 3 | [`modulo3/ddl_dml_bodega.sql`](modulo3/ddl_dml_bodega.sql) | DDL y DML del inventario de BodegaTech: tabla `inventario` con 10 productos, ventas y baja lógica. |
| 3 | [`modulo3/ventas_tech_db.sql`](modulo3/ventas_tech_db.sql) | Esquema normalizado (3NF) de `Ventas_Tech_DB`: categorías, clientes, productos y ventas, con 25 registros iniciales. |

## Estructura del repositorio

```
.
├── modulo2_unidad1_diseno.sql
├── modulo3/
│   ├── ddl_dml_bodega.sql
│   └── ventas_tech_db.sql
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
