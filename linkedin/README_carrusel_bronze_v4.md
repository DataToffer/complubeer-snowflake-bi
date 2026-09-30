# Carrusel LinkedIn · Bronze

Carrusel de la primera entrega de la serie **Modelado Medallion con CompluBeer**.

La pieza resume visualmente la lógica de la capa Bronze: carga de CSV, tablas RAW, validación inicial, trazabilidad y primer diagnóstico de calidad.

## Idea central

Bronze no es una papelera de datos. Es la capa donde cargamos, preservamos, validamos y entendemos el dato antes de transformarlo.

## Copy propuesto

🥉 **Modelado Medallion con CompluBeer: cuando el dashboard empieza antes del dashboard.**

CompluBeer es una empresa ficticia que utilizamos en clase para trabajar algo muy real: cómo se construye un flujo analítico desde el dato bruto hasta la visualización final.

En el taller del Máster de Data Science, Big Data & Business Analytics de la Universidad Complutense de Madrid recorremos el ciclo de vida del dato con Snowflake, SQL y Tableau:

🥉 BRONZE → 🥈 SILVER → 🥇 GOLD → 📊 TABLEAU

Y lo desarrollaremos en una serie de posts, capa a capa.

El valor pedagógico del caso está precisamente ahí: el alumnado no trabaja con ejemplos aislados, sino con un contexto completo donde cada decisión tiene consecuencias.

Si el dato se carga mal, el modelo nace mal.  
Si no se entiende la granularidad, los KPIs no cuadran.  
Si no se detectan inconsistencias, el dashboard puede contar una historia equivocada.

En esta primera entrega nos centramos en 🥉 BRONZE:

📥 carga de CSV  
🧱 tablas RAW  
🔎 validación inicial  
🧭 trazabilidad  
🧪 primer diagnóstico de calidad

Este tipo de casos permite que los alumnos se enfrenten a problemas habituales en proyectos reales de Data & Analytics: formatos distintos, categorías inconsistentes, duplicados, nulos y decisiones de modelado que condicionan todo lo que viene después.

➡️ Próxima entrega: 🥈 SILVER, donde el dato empieza a convertirse en una base confiable para el análisis.
