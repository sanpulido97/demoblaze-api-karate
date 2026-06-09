README - Automatización API DemoBlaze con Karate DSL

Proyecto:

Este proyecto contiene pruebas automatizadas de servicios REST para las funcionalidades de Signup y Login de DemoBlaze.

Servicios evaluados:

* Signup: https://api.demoblaze.com/signup
* Login: https://api.demoblaze.com/login

Tecnologías utilizadas:

* Java 17
* Gradle
* Karate DSL
* JUnit 5

Casos automatizados:

1. Crear un nuevo usuario en signup.
2. Intentar crear un usuario ya existente.
3. Login con usuario y contraseña correctos.
4. Login con usuario y contraseña incorrectos.

Requisitos previos:

* Tener instalado Java JDK 17 o superior.
* Tener conexión a internet.
* Tener Gradle configurado o utilizar el Gradle Wrapper incluido.

Pasos de ejecución:

1. Clonar el repositorio:

git clone <https://github.com/sanpulido97/demoblaze-api-karate.git>

2. Ingresar al proyecto:

cd demoblaze-api-karate

3. Ejecutar las pruebas:

./gradlew clean test

En Windows PowerShell:

.\gradlew clean test

4. Abrir el reporte generado:

build/reports/tests/test/index.html

Resultado esperado:

La ejecución debe finalizar correctamente con los 4 escenarios exitosos y una tasa de éxito del 100%.

Notas:

Las pruebas imprimen en consola las entradas enviadas y las salidas recibidas para cada caso evaluado, permitiendo evidenciar el comportamiento de los servicios Signup y Login.
