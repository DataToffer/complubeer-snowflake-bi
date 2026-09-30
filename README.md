# CompluBeer · Snowflake BI

Caso práctico docente para trabajar el ciclo de vida del dato mediante un enfoque **Medallion** en Snowflake, SQL y Tableau.

CompluBeer es una empresa ficticia utilizada en el taller del Máster de Data Science, Big Data & Business Analytics de la Universidad Complutense de Madrid. El objetivo es que el alumnado trabaje con un contexto completo, no con ejercicios aislados: carga, validación, exploración, limpieza, modelado y visualización.

## Serie de trabajo

- 🥉 **Bronze**: carga de datos brutos, tablas RAW, trazabilidad, validación inicial y análisis exploratorio.
- 🥈 **Silver**: limpieza, tipado, normalización y reglas de calidad. Próxima capa.
- 🥇 **Gold**: modelo analítico preparado para BI y Tableau. Próxima capa.

## Contenido actual

```text
data/
  canales_complubeer.csv
  objetivos_complubeer.csv
  productos_complubeer.csv
  ventas_complubeer.csv

sql/
  00_bronze_setup_load.sql
  01_analisis_exploratorio_bronze.sql

docs/
  README_dataset_complubeer.md

linkedin/
  README_carrusel_bronze_v4.md
```

## Cómo reproducir la capa Bronze

1. Crear una base de datos o utilizar una existente en Snowflake.
2. Ejecutar `sql/00_bronze_setup_load.sql`.
3. Cargar los CSV de la carpeta `data/` en el stage definido en el script.
4. Validar conteos y estructura.
5. Ejecutar `sql/01_analisis_exploratorio_bronze.sql` para diagnosticar el dato antes de transformarlo.

## Valor pedagógico

El caso está diseñado para mostrar que un dashboard no empieza en la herramienta de visualización. Empieza antes: en la comprensión del dato, su granularidad, sus problemas de calidad y las decisiones de modelado que condicionan los KPIs y la narrativa analítica.

## Post de la serie

🥉 **Modelado Medallion con CompluBeer: cuando el dashboard empieza antes del dashboard.**

CompluBeer es una empresa ficticia que utilizamos en clase para trabajar algo muy real: cómo se construye un flujo analítico desde el dato bruto hasta la visualización final.

En el taller del Máster de Data Science, Big Data & Business Analytics de la Universidad Complutense de Madrid recorremos el ciclo de vida del dato con Snowflake, SQL y Tableau:

🥉 BRONZE → 🥈 SILVER → 🥇 GOLD → 📊 TABLEAU

Y lo desarrollaremos en una serie de posts, capa a capa.
