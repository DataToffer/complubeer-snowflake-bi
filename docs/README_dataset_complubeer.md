# Dataset CompluBeer

Paquete de datos para el taller **Del dato bruto a la decisión: ciclo de vida del dato con Snowflake y Tableau**.

## Archivos CSV

- `ventas_complubeer.csv`: ventas transaccionales de CompluBeer. Incluye problemas controlados de calidad de datos para trabajar la capa Silver.
- `productos_complubeer.csv`: maestro de productos con familia, estilo, ABV, IBU, formato, coste y precio de referencia.
- `canales_complubeer.csv`: tabla de normalización de canales comerciales.
- `objetivos_complubeer.csv`: objetivos mensuales por región, canal y producto.

## Volumen de datos

- Ventas: 1,066 filas, incluyendo duplicados controlados.
- Productos: 10 productos.
- Canales: 8 registros de mapeo.
- Objetivos: 638 filas.

## Problemas de calidad incluidos

- Fechas con formatos mixtos: `YYYY-MM-DD`, `DD/MM/YYYY` y `DD-MM-YYYY`.
- Canales con variantes: `HORECA`, `horeca`, `Hostelería`, `Retail`, `Alimentación`, etc.
- Regiones con mayúsculas, minúsculas y espacios finales.
- Decimales con punto y algunos con coma.
- Descuentos vacíos que deben tratarse como cero.
- Duplicados por `id_venta`.
- IDs de producto con minúsculas o espacios.

## Uso recomendado

1. Cargar los cuatro CSV en Snowflake en la capa `BRONZE`.
2. Crear vistas `SILVER` para limpiar y normalizar.
3. Crear la capa `GOLD` orientada a BI.
4. Conectar Tableau a la capa Gold.
5. Construir dashboard exploratorio, dashboard ejecutivo e historia final.
