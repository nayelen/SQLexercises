-- 1. Crea una base de datos llamada "MiBaseDeDatos".
CREATE DATABASE mibasededatos
-- 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).
CREATE TABLE IF NOT EXISTS usuarios(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR (255),
  edad INT
)
-- 3. Inserta dos registros en la tabla "Usuarios".
INSERT INTO usuarios(id, nombre, edad)
VALUES (1,'Pedro', 30)
INSERT INTO usuarios(id, nombre, edad)
VALUES (2,'Laura', 28)
-- 4. Actualiza la edad de un usuario en la tabla "Usuarios".
UPDATE usuarios 
SET edad = 35
WHERE id = 1
-- 5. Elimina un usuario de la tabla "Usuarios".
DELETE FROM usuarios 
WHERE id = 2
-- Nivel de dificultad: Moderado
-- 1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).
CREATE TABLE IF NOT EXISTS ciudades (
id SERIAL PRIMARY KEY,
nombre VARCHAR(255),
pais VARCHAR(255)
)
-- 2. Inserta al menos tres registros en la tabla "Ciudades".
INSERT INTO ciudades(id, nombre, pais)
VALUES (1,'Madrid', 'España')
INSERT INTO ciudades(id, nombre, pais)
VALUES (2,'París', 'Francia')
INSERT INTO ciudades(id, nombre, pais)
VALUES (3,'Buenos Aires', 'Argentina')
-- 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".
ALTER TABLE usuarios
ADD COLUMN ciudad_id INT
ALTER TABLE usuarios
ADD CONSTRAINT fk_ciudad
FOREIGN KEY (ciudad_id) 
REFERENCES ciudades(id);
-- 4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).
SELECT usuarios.nombre, ciudades.nombre, ciudades.país
FROM usuarios
LEFT JOIN ciudades	
ON usuarios.ciudad_id = ciudades.id
-- 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).
SELECT usuarios.nombre, ciudades.nombre, ciudades.pais
FROM usuarios
INNER JOIN ciudades	
ON usuarios.ciudad_id = ciudades.id