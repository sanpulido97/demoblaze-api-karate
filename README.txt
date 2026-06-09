PRUEBA DE CARGA – SERVICIO DE LOGIN

1. DESCRIPCIÓN

Este proyecto contiene una prueba de carga desarrollada con K6 para evaluar el comportamiento del servicio de autenticación (Login) bajo una carga constante de 20 transacciones por segundo (TPS).

La prueba utiliza datos parametrizados desde un archivo CSV y valida los criterios de aceptación definidos para tiempos de respuesta y tasa de error.

2. TECNOLOGÍAS UTILIZADAS

* K6 v2.0.0
* JavaScript ES6
* CSV para parametrización de datos
* Windows PowerShell

3. ESTRUCTURA DEL PROYECTO

performance-login-test/

├── data/
│   └── users.csv
│
├── scripts/
│   └── login-load-test.js
│
├── reports/
│   └── summary.json
│
├── README.txt
├── conclusiones.txt
└── .gitignore

4. DATOS DE PRUEBA

Los datos utilizados durante la ejecución se encuentran parametrizados en el archivo:

data/users.csv

Cada iteración selecciona de forma aleatoria un usuario para realizar la autenticación.

5. ESCENARIO DE CARGA

Configuración aplicada:

* Tipo de escenario: Constant Arrival Rate
* Tasa objetivo: 20 TPS
* Duración: 5 minutos
* VUs preasignados: 20
* Máximo de VUs: 100

6. CRITERIOS DE ACEPTACIÓN

* Tiempo máximo permitido: 1.5 segundos
* Tasa de error permitida: menor al 3%
* Respuesta exitosa del servicio
* Generación correcta del token de autenticación

7. THRESHOLDS CONFIGURADOS

http_req_duration:
p(95) < 1500 ms

http_req_failed:
rate < 0.03

checks:
rate > 0.97

8. INSTALACIÓN

Instalar K6:

winget install k6 --source winget

Verificar instalación:

k6 version

9. EJECUCIÓN

Ubicarse en la raíz del proyecto y ejecutar:

k6 run scripts/login-load-test.js

Para exportar el resumen de resultados:

k6 run --summary-export=reports/summary.json scripts/login-load-test.js

10. VALIDACIONES IMPLEMENTADAS

* Código HTTP 200 o 201
* Tiempo de respuesta menor o igual a 1.5 segundos
* Existencia del token de autenticación
* Monitoreo de tasa de errores

11. RESULTADOS OBTENIDOS

* Peticiones ejecutadas: 6001
* Tiempo promedio: 479.65 ms
* Percentil 95: 510.97 ms
* Tasa de error: 0.06 %
* Checks exitosos: 99.45 %

12. CONCLUSIÓN

El servicio evaluado cumplió satisfactoriamente los criterios de aceptación definidos para la prueba de carga, manteniendo tiempos de respuesta y tasa de error dentro de los límites establecidos.
