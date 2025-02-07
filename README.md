# Mis compras By Simon

[![image](https://cdn.discordapp.com/attachments/1203034242418745344/1268227612262531084/image.png?ex=66aba881&is=66aa5701&hm=ccf34b220fa418236997309d4aa2ae1ecdab16005797896ba0372c88f7ddfab2&)

## Consultas Básicas

- Consultar todos los productos y sus categorías

  ```mysql
  SELECT p.nombre, pc.descripcion AS Categoria, p.codigo_barras, p.precio_venta, p.cantidad_stock, p.estado
  FROM productos p
  JOIN categorias pc ON pc.id_categoria = p.id_categoria;
  ```

- Consultar todas las compras y los clientes que las realizaron

  ```mysql
  SELECT c.id_compra, c.id_cliente, cl.nombre, cl.apellidos, c.fecha, c.medio_pago, cp.id_producto, cp.cantidad, cp.total
  FROM compras c
  JOIN clientes cl ON cl.id = c.id_cliente
  JOIN compras_productos cp ON cp.id_compra = c.id_compra;
  ```

  

- Consultar los productos comprados en una compra específica

  ```mysql
  SELECT p.nombre, cp.cantidad, cp.total
  FROM compras_productos cp
  JOIN productos p ON cp.id_producto = p.id_producto
  WHERE cp.id_compra = 1;
  
  ```

- Agregar un nuevo producto

  ```mysql
  INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) VALUES
  ('Lavadora', 1, '8539856393', 2000.00, 5, 1);
  ```

  

- Actualizar el stock de un producto

  ```mysql
  UPDATE productos
  SET cantidad_stock = 30
  WHERE id_producto = 4;
  ```

- Consultar todas las compras de un cliente específico

  ```mysql
  SELECT c.id, c.nombre,co.id_compra, co.fecha AS Fecha_compra, co.medio_pago, co.comentario 
  FROM clientes c
  JOIN compras co ON co.id_cliente = c.id
  WHERE c.id = 'C1234';
  ```

  

- Consultar todos los clientes y sus correos electrónicos

  ```mysql
  SELECT c.id, c.nombre, c.apellidos, c.correo_electronico
  FROM clientes c;
  ```

  

- Consultar la cantidad total de productos comprados en cada compra

  ```mysql
  SELECT cp.id_compra, SUM(cp.cantidad) AS total_productos
  FROM compras_productos cp
  GROUP BY cp.id_compra;
  ```

  

- Consultar las compras realizadas en un rango de fechas

  ```mysql
  SELECT c.id_compra, c.id_cliente, ci.nombre, c.fecha, c.medio_pago
  FROM compras c
  JOIN clientes ci ON ci.id = c.id_cliente
  WHERE c.fecha BETWEEN '2024-07-30' AND '2024-08-31';
  
  ```



## Consultas usando funciones agregadas

- Contar la cantidad de productos por categoría

  ```mysql
  SELECT c.descripcion AS categoria, COUNT(p.id_producto) AS cantidad_productos
  FROM productos p
  JOIN categorias c ON p.id_categoria = c.id_categoria
  GROUP BY c.descripcion;
  
  ```

  

- Calcular el precio total de ventas por cada cliente

  ```mysql
  SELECT c.id_cliente, cl.nombre, SUM(cp.total) AS Total
  FROM compras c
  JOIN clientes cl ON c.id_cliente = cl.id
  JOIN compras_productos cp ON c.id_compra = cp.id_compra
  GROUP BY c.id_cliente;
  
  ```

  

- Calcular el precio promedio de los productos por categoría

  ```mysql
  SELECT ca.descripcion AS categoria,AVG(p.precio_venta) AS Precio_promedio
  FROM productos p
  JOIN categorias ca ON p.id_categoria = ca.id_categoria
  GROUP BY ca.descripcion;
  ```

  

- Encontrar la fecha de la primera y última compra registrada

  ```
  SELECT MIN(fecha) AS Primera_Compra, MAX(fecha) AS Ultima_compra
  FROM compras;
  ```

  

- Calcular el total de ingresos por ventas

  ```mysql
  SELECT c.id_cliente,cp.id_compra, SUM(cp.total) AS total
  FROM compras_productos cp
  JOIN compras c ON c.id_compra = cp.id_compra
  GROUP BY cp.id_compra;
  ```

  

- Contar la cantidad de compras realizadas por cada medio de pago

  ```mysql
  SELECT medio_pago, COUNT(id_compra) AS Cantidad_compras
  FROM compras
  GROUP BY medio_pago;
  ```

  

- Calcular el total de productos vendidos por cada producto

  ```mysql
  SELECT p.nombre,SUM(cp.cantidad) AS Total_vendido
  FROM productos p
  JOIN compras_productos cp ON cp.id_producto = p.id_producto
  GROUP BY p.nombre;
  ```

  

- Obtener el promedio de cantidad de productos comprados por compra

  ```mysql
  SELECT c.id_compra, AVG(cp.cantidad) AS Promedio_de_productos
  FROM compras c
  JOIN compras_productos cp ON cp.id_compra = c.id_compra
  GROUP BY c.id_compra;
  ```

  

- Encontrar los productos con el stock más bajo

  ```mysql
  SELECT nombre AS Menor_Stock, MIN(cantidad_stock) AS Stock
  FROM productos
  GROUP BY nombre
  LIMIT 1;
  ```

  

- Calcular el total de productos comprados y el total gastado por cliente

  ```mysql
  SELECT c.id_cliente, SUM(cp.cantidad) AS Total_productos, SUM(cp.total) AS Total
  FROM compras c
  JOIN compras_productos cp ON cp.id_compra = c.id_compra
  GROUP BY c.id_cliente;
  ```



## Consultas usando join

- Consultar todos los productos con sus categorías

  ```mysql
  SELECT p.nombre, pc.descripcion AS Categoria, p.codigo_barras, p.precio_venta, p.cantidad_stock, p.estado
  FROM productos p
  JOIN categorias pc ON pc.id_categoria = p.id_categoria;
  ```

  

- Consultar todas las compras y los clientes que las realizaron

  ```mysql
  SELECT c.id_compra, c.id_cliente, cl.nombre, cl.apellidos, c.fecha, c.medio_pago, cp.id_producto, cp.cantidad, cp.total
  FROM compras c
  JOIN clientes cl ON cl.id = c.id_cliente
  JOIN compras_productos cp ON cp.id_compra = c.id_compra;
  ```

  

- Consultar los productos comprados en cada compra

  ```mysql
  SELECT c.id_compra,p.nombre, cp.cantidad, cp.total
  FROM compras_productos cp
  JOIN productos p ON cp.id_producto = p.id_producto
  JOIN compras c ON cp.id_compra = c.id_compra;
  ```

  

- Consultar las compras realizadas por un cliente específico

  ```mysql
  SELECT c.id, c.nombre,co.id_compra, co.fecha AS Fecha_compra, co.medio_pago, co.comentario 
  FROM clientes c
  JOIN compras co ON co.id_cliente = c.id
  WHERE c.id = 'C1234';
  ```

  

- Consultar el total gastado por cada cliente

  ```mysql
  SELECT c.id_cliente, cl.nombre, SUM(cp.total) AS Total
  FROM compras c
  JOIN clientes cl ON c.id_cliente = cl.id
  JOIN compras_productos cp ON c.id_compra = cp.id_compra
  GROUP BY c.id_cliente;
  
  ```

  

- Consultar el stock disponible de productos y su categoría

  ```mysql
  SELECT p.nombre , c.descripcion, p.cantidad_stock
  FROM productos p
  JOIN categorias c ON c.id_categoria = p.id_categoria;
  
  ```

  

- Consultar los detalles de compras junto con la información del cliente y el producto

  ```mysql
  SELECT c.id_compra,c.fecha,c.medio_pago,c.estado,cl.id AS id_cliente, cl.nombre,cl.apellidos,cl.celular,cl.direccion, cl.correo_electronico,p.nombre AS nombre_producto,cp.cantidad,cp.total
  FROM compras c
  JOIN clientes cl ON c.id_cliente = cl.id
  JOIN compras_productos cp ON c.id_compra = cp.id_compra
  JOIN productos p ON cp.id_producto = p.id_producto
  ORDER BY c.id_compra, p.id_producto;
  ```

  

- Consultar los productos que han sido comprados por más de una cantidad específica

  ```mysql
  SELECT cp.id_producto,nombre,cp.cantidad AS Cantidad_vendidad
  FROM compras_productos cp
  JOIN productos p ON p.id_producto = cp.id_producto
  WHERE cp.cantidad > 8;
  ```

  

- Consultar la cantidad total de productos vendidos por categoría

  ```mysql
  SELECT c.id_categoria, c.descripcion AS categoria, SUM(cp.cantidad) AS total_productos_vendidos
  FROM categorias c
  JOIN productos p ON c.id_categoria = p.id_categoria
  JOIN  compras_productos cp ON p.id_producto = cp.id_producto
  GROUP BY c.id_categoria;
  ```

  

- Consultar los clientes que han realizado compras en un rango de fechas específico

  ```mysql
  SELECT c.id_compra, c.id_cliente, ci.nombre, c.fecha
  FROM compras c
  JOIN clientes ci ON ci.id = c.id_cliente
  WHERE c.fecha BETWEEN '2024-07-30' AND '2024-08-31';
  ```

  

- Consultar el total gastado por cada cliente junto con la cantidad total de productos comprados 

  ```mysql
  SELECT c.id_cliente, SUM(cp.cantidad) AS Total_productos, SUM(cp.total) AS Total
  FROM compras c
  JOIN compras_productos cp ON cp.id_compra = c.id_compra
  GROUP BY c.id_cliente;
  ```

  

- Consultar los productos que nunca han sido comprados

  ```MYSQL
  SELECT p.id_producto, p.nombre AS nombre_producto,p.cantidad_stock, p.estado
  FROM productos p
  LEFT JOIN compras_productos cp ON p.id_producto = cp.id_producto
  WHERE cp.id_producto IS NULL;
  
  ```

  

- Consultar los clientes que han realizado más de una compra y el total gastado por ellos

  

  ```mysql
  SELECT cl.id,cl.nombre,cl.apellidos, SUM(cp.total) AS total_gastado
  FROM clientes cl
  JOIN compras c ON cl.id = c.id_cliente
  JOIN compras_productos cp ON c.id_compra = cp.id_compra
  GROUP BY cl.id
  HAVING COUNT(c.id_compra) > 1;
  ```

  

- Consultar los productos más vendidos por categoría

  ```mysql
  SELECT p.id_categoria, ca.descripcion, p.nombre, SUM(cp.cantidad) AS Stock_vendido
  FROM productos p
  JOIN categorias ca ON ca.id_categoria = p.id_categoria
  JOIN compras_productos cp ON cp.id_producto = p.id_producto
  GROUP BY p.id_categoria, ca.descripcion, p.nombre
  ORDER BY p.id_categoria, Stock_vendido ASC;
  
  ```

  

- Consultar las compras realizadas por clientes de una ciudad específica y el total gastado

  ```mysql
  SELECT cl.id AS id_cliente, cl.nombre,cl.direccion, c.id_compra, SUM(cp.total) AS total_compra
  FROM clientes cl
  JOIN compras c ON cl.id = c.id_cliente
  JOIN compras_productos cp ON c.id_compra = cp.id_compra
  WHERE cl.direccion = 'Calle 123 #45-67'
  GROUP BY cl.id, cl.nombre, cl.apellidos, cl.direccion, c.id_compra;
  ```

​	 

## Subconsultas

- Consultar los productos que tienen un precio de venta superior al precio promedio de todos los productos

  ```mysql
  SELECT p.id_producto, p.nombre, p.precio_venta 
  FROM productos p 
  WHERE p.precio_venta > (
      	SELECT AVG(precio_venta) 
      	FROM productos);
  ```

  

- Consultar los clientes que han gastado más del promedio general en sus compras

  ```mysql
  SELECT c.id, c.nombre, c.apellidos, SUM(cp.total) AS total_gastado 
  FROM clientes c 
  JOIN compras co ON c.id = co.id_cliente 
  JOIN compras_productos cp ON co.id_compra = cp.id_compra 
  GROUP BY c.id 
  HAVING total_gastado > (
  	SELECT AVG(total) 
  	FROM compras_productos);
  ```

  

- Consultar las categorías que tienen más de 5 productos

  ```mysql
  SELECT id_categoria, descripcion 
  FROM categorias 
  WHERE id_categoria IN (
      SELECT id_categoria 
      FROM productos 
      GROUP BY id_categoria 
      HAVING COUNT(id_producto) > 5);
  ```

  

- Consultar los productos más vendidos (top 5) por categoría

  ```mysql
  SELECT p.id_categoria, p.nombre, 
         (SELECT SUM(cantidad) 
          FROM compras_productos 
          WHERE id_producto = p.id_producto) as total_vendido
  FROM productos p
  WHERE p.id_categoria = 1
  GROUP BY p.id_categoria, p.id_producto
  ORDER BY p.id_categoria, total_vendido DESC
  LIMIT 5;
  ```

  

- Consultar los clientes que han realizado compras en los últimos 30 días

  ```mysql
  SELECT cl.id, cl.nombre
  FROM clientes cl
  WHERE cl.id IN (
      SELECT c.id_cliente
      FROM compras c
      WHERE c.fecha >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
  );
  ```

  

- Consultar las compras y sus productos para un cliente específico, mostrando solo las compras más recientes

  ```mysql
  SELECT c.id_compra,cl.id,cl.nombre, c.fecha, p.nombre AS producto
  FROM compras c
  JOIN compras_productos cp ON c.id_compra = cp.id_compra
  JOIN clientes cl ON cl.id =  c.id_cliente
  JOIN productos p ON cp.id_producto = p.id_producto
  WHERE c.id_compra IN (
      SELECT id_compra
      FROM compras
      WHERE id_cliente = 'C1234'
  )
  ORDER BY c.fecha DESC
  LIMIT 1;
  ```

 - Consultar los productos que se han vendido menos de la cantidad promedio de productos vendidos
  ```mysql
SELECT p.id_producto, p.nombre
FROM productos p
LEFT JOIN compras_productos cp ON p.id_producto = cp.id_producto
GROUP BY p.id_producto, p.nombre
HAVING SUM(cp.cantidad) < (
    SELECT AVG(cantidad)
    FROM compras_productos
);
  ```
  