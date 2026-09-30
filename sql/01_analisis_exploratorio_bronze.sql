-- ============================================================
-- CompluBeer · Análisis exploratorio en BRONZE
-- Objetivo: entender el dato antes de limpiarlo y modelarlo.
-- ============================================================

USE DATABASE TALLER_DATO_DECISION;
USE SCHEMA BRONZE;

-- 1. Volumen de datos cargado
SELECT 'RAW_VENTAS' AS tabla, COUNT(*) AS filas FROM RAW_VENTAS
UNION ALL
SELECT 'RAW_PRODUCTOS', COUNT(*) FROM RAW_PRODUCTOS
UNION ALL
SELECT 'RAW_OBJETIVOS', COUNT(*) FROM RAW_OBJETIVOS
UNION ALL
SELECT 'RAW_CANALES', COUNT(*) FROM RAW_CANALES;

-- 2. Primera inspección visual
SELECT * FROM RAW_VENTAS LIMIT 20;
SELECT * FROM RAW_PRODUCTOS LIMIT 20;
SELECT * FROM RAW_OBJETIVOS LIMIT 20;
SELECT * FROM RAW_CANALES LIMIT 20;

-- 3. Granularidad de ventas
SELECT
    COUNT(*) AS filas,
    COUNT(DISTINCT ID_VENTA) AS ventas_distintas,
    COUNT(DISTINCT ID_PRODUCTO) AS productos_distintos,
    COUNT(DISTINCT REGION) AS regiones_distintas,
    COUNT(DISTINCT CIUDAD) AS ciudades_distintas,
    COUNT(DISTINCT CANAL) AS canales_distintos
FROM RAW_VENTAS;

-- 4. Granularidad de objetivos
SELECT
    COUNT(*) AS filas,
    COUNT(DISTINCT ANIO || '-' || MES || '-' || REGION || '-' || CANAL || '-' || ID_PRODUCTO) AS combinaciones_objetivo,
    COUNT(DISTINCT ID_PRODUCTO) AS productos_distintos,
    COUNT(DISTINCT REGION) AS regiones_distintas,
    COUNT(DISTINCT CANAL) AS canales_distintos
FROM RAW_OBJETIVOS;

-- 5. Fechas: detectar formatos y rango temporal antes de tipar
SELECT
    MIN(FECHA_VENTA) AS fecha_min_raw,
    MAX(FECHA_VENTA) AS fecha_max_raw,
    COUNT(DISTINCT FECHA_VENTA) AS fechas_distintas
FROM RAW_VENTAS;

SELECT
    ANIO,
    MES,
    COUNT(*) AS filas
FROM RAW_VENTAS
GROUP BY ANIO, MES
ORDER BY ANIO, MES;

-- 6. Canales: detectar variantes antes de normalizar
SELECT
    CANAL,
    COUNT(*) AS filas
FROM RAW_VENTAS
GROUP BY CANAL
ORDER BY filas DESC;

SELECT
    CANAL,
    COUNT(*) AS filas
FROM RAW_OBJETIVOS
GROUP BY CANAL
ORDER BY filas DESC;

SELECT * FROM RAW_CANALES ORDER BY CANAL_RAW;

-- 7. Regiones y ciudades: detectar espacios, mayúsculas y variantes
SELECT
    REGION,
    CIUDAD,
    COUNT(*) AS filas
FROM RAW_VENTAS
GROUP BY REGION, CIUDAD
ORDER BY REGION, CIUDAD;

-- 8. Nulos o campos vacíos relevantes
SELECT
    COUNT_IF(ID_VENTA IS NULL OR TRIM(ID_VENTA) = '') AS id_venta_vacios,
    COUNT_IF(FECHA_VENTA IS NULL OR TRIM(FECHA_VENTA) = '') AS fecha_vacia,
    COUNT_IF(ID_PRODUCTO IS NULL OR TRIM(ID_PRODUCTO) = '') AS producto_vacio,
    COUNT_IF(CANAL IS NULL OR TRIM(CANAL) = '') AS canal_vacio,
    COUNT_IF(INGRESOS_EUR IS NULL OR TRIM(INGRESOS_EUR) = '') AS ingresos_vacios,
    COUNT_IF(DESCUENTO_EUR IS NULL OR TRIM(DESCUENTO_EUR) = '') AS descuento_vacio
FROM RAW_VENTAS;

-- 9. Duplicados de ventas
SELECT
    ID_VENTA,
    COUNT(*) AS apariciones
FROM RAW_VENTAS
GROUP BY ID_VENTA
HAVING COUNT(*) > 1
ORDER BY apariciones DESC, ID_VENTA;

-- 10. Integridad referencial preliminar: ventas sin producto maestro
SELECT DISTINCT v.ID_PRODUCTO
FROM RAW_VENTAS v
LEFT JOIN RAW_PRODUCTOS p
    ON TRIM(UPPER(v.ID_PRODUCTO)) = TRIM(UPPER(p.ID_PRODUCTO))
WHERE p.ID_PRODUCTO IS NULL
ORDER BY v.ID_PRODUCTO;

-- 11. Integridad referencial preliminar: objetivos sin producto maestro
SELECT DISTINCT o.ID_PRODUCTO
FROM RAW_OBJETIVOS o
LEFT JOIN RAW_PRODUCTOS p
    ON TRIM(UPPER(o.ID_PRODUCTO)) = TRIM(UPPER(p.ID_PRODUCTO))
WHERE p.ID_PRODUCTO IS NULL
ORDER BY o.ID_PRODUCTO;

-- 12. Métricas en bruto: revisar si los campos numéricos están listos para tipar
SELECT
    VOLUMEN_HL,
    INGRESOS_EUR,
    DESCUENTO_EUR
FROM RAW_VENTAS
LIMIT 50;

-- 13. Diagnóstico previo a Silver
-- Preguntas que deben quedar respondidas antes de transformar:
-- - ¿Cuál es la granularidad real de cada fuente?
-- - ¿Qué campos deben tiparse como fecha o número?
-- - ¿Qué categorías necesitan normalización?
-- - ¿Dónde hay nulos, duplicados o inconsistencias?
-- - ¿Qué reglas de calidad se aplicarán en Silver?
