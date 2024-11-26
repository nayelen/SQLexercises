-- 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").
CREATE TABLE IF NOT EXISTS pedidos(
id SERIAL PRIMARY KEY,
id_usuario INT,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
id_producto INT, 
FOREIGN KEY (id_producto) REFERENCES productos(id)
)
-- 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.
INSERT INTO pedidos(id, id_usuario, id_producto)
VALUES (1,1,2)
INSERT INTO pedidos(id, id_usuario, id_producto)
VALUES (2,1,1)
INSERT INTO pedidos(id, id_usuario, id_producto)
VALUES (3,1,1)
-- 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).
SELECT usuarios.nombre AS nombre,
productos.nombre AS producto, 
pedidos.id_producto AS pedido,
FROM usuarios
LEFT JOIN productos
ON usuarios.id = productos.clienteid
LEFT JOIN pedidos
ON usuarios.id = pedidos.id_usuario
-- 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).
SELECT usuarios.nombre, 
pedidos.id_usuario
FROM usuarios
LEFT JOIN pedidos
ON usuarios.id = pedidos.id_usuario

-- 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)
ALTER TABLE pedidos
ADD COLUMN cantidad INT
UPDATE pedidos
SET cantidad = 1
WHERE id_usuario = 1 
