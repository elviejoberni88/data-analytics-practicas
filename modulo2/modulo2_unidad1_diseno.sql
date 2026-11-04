-- Módulo 2 - Unidad 1
-- Diseño de tablas: clientes y productos
-- Motor: SQL Server 2025
CREATE TABLE clientes (
    -- INT: identificador numérico entero.
    id_cliente     INT           IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    -- VARCHAR(100): le brindamos un espacio de texto hasta 100 caracteres.
    nombre         VARCHAR (100) NOT NULL,
    -- VARCHAR(MAX): le brindamos la posibilidad de escribir el texto tan largo como desee.
    perfil_bio     VARCHAR (MAX),
    -- DATE: nos permite identificar la fecha exacta del registro del cliente.
    fecha_registro DATE          DEFAULT GETDATE() NOT NULL
);

CREATE TABLE productos (
    -- INT: identificador numérico entero.
    id_producto INT             IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    -- VARCHAR(255): le brindamos un espacio de texto hasta 255 caracteres.
    descripcion VARCHAR (255)   NOT NULL,
    -- DECIMAL (10,2): 10 dígitos totales, de los cuales 2 son decimales (llega hasta 99.999.999,99).
    precio      DECIMAL (10, 2) NOT NULL,
    -- BIT: solo 0/1; 1 = a la venta, 0 = dado de baja. Evita valores intermedios sin reglas extra.
    esta_activo BIT             NOT NULL
);