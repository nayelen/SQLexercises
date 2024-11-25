-- 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).
CREATE TABLE IF NOT EXISTS productos(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR (255),
  precio NUMERIC
)
-- 2. Inserta al menos cinco registros en la tabla "Productos".
INSERT INTO productos(nombre, precio)
VALUES ('libro', 15)
INSERT INTO productos(nombre, precio)
VALUES ('cuaderno', 10)
INSERT INTO productos(nombre, precio)
VALUES ('lapiz', 5)
-- 3. Actualiza el precio de un producto en la tabla "Productos".
UPDATE productos
SET precio = 7
WHERE id = 3
-- 4. Elimina un producto de la tabla "Productos".
DELETE FROM productos
WHERE id = 3
-- 5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").
ALTER TABLE productos
ADD clienteID INT
SELECT
usuarios.nombre AS usuario,
productos.nombre AS producto
FROM usuarios 
INNER JOIN productos ON usuarios.id = productos.clienteID