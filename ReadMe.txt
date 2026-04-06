Cómo ejecutar el proyecto (sin Docker)
1. Requisitos:

PHP 8.2 o superior 
Composer
MySQL
Symfony CLI (opcional pero recomendado)

2. Crear la base de datos
Crear una base de datos llamada:

proveedores_viajesPTI

3. Importar los datos incluidos
En la terminal:

mysql -u root -p proveedores_viajesPTI < proveedores_viajespti.sql

->Esto importará toda la estructura y los datos reales (aprox. 70 proveedores).

4. Instalar dependencias

en el terminal -> composer install

5. Ejecutar el servidor de Symfony

symfony server:start

6. Abrir la aplicación

http://127.0.0.1:8000

7. Base de datos
El archivo proveedores_viajespti.sql contiene:

Tablas del proyecto

Datos reales de proveedores

Estructura generada por Doctrine

8. Estructura del proyecto
src/ – Controladores, entidades y lógica

templates/ – Vistas Twig

public/ – Document root

migrations/ – Migraciones de Doctrine

proveedores_viajespti.sql – Base de datos exportada

composer.json – Dependencias del proyecto