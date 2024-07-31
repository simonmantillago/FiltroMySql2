
INSERT INTO clientes (id, nombre, apellidos, celular, direccion, correo_electronico) VALUES
('C1234', 'Valentina', 'Gómez López', 3156781234, 'Calle 123 #45-67', 'valentina.gomez@gmail.com'),
('C5678', 'Carlos', 'Martínez Rivera', 3189456789, 'Avenida 8 #98-32', 'carlos.martinez@gmail.com'),
('C9101', 'Laura', 'Fernández Mejía', 3167894567, 'Carrera 15 #20-50', 'laura.fernandez@gmail.com');

INSERT INTO categorias (descripcion, estado) VALUES
('Electrodomésticos', 1),
('Ropa', 1),
('Alimentos', 1);

INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) VALUES
('Refrigerador', 1, '1234567890123', 1200.50, 15, 1),
('Camisa', 2, '2345678901234', 35.99, 50, 1),
('Manzanas', 3, '3456789012345', 2.99, 200, 1);

INSERT INTO compras (id_cliente, fecha, medio_pago, comentario, estado) VALUES
('C1234', '2024-07-31 10:30:00', 'Card', 'Urgente', 'A'),
('C5678', '2024-07-30 15:45:00', 'Transferencia', 'Sin comentarios', 'B'),
('C9101', '2024-07-29 09:20:00', 'Efectivo', 'Preferencia por pago en efectivo', 'C');

INSERT INTO compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
(1, 2, 1, 35.99, 1),
(2, 2, 3, 107.97, 1),
(3, 3, 10, 29.90, 1);
