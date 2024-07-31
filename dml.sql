DROP DATABASE IF EXISTS miscompras;
CREATE DATABASE miscompras;

USE miscompras;


CREATE TABLE clientes (
    id VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    celular DECIMAL(10,0) NOT NULL,
    direccion VARCHAR(80) NOT NULL,
    correo_electronico VARCHAR(70) NOT NULL
);


CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(45) NOT NULL,
    estado TINYINT NOT NULL
);


CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    id_categoria INT,
    codigo_barras VARCHAR(150) NOT NULL,
    precio_venta DECIMAL(16,2) NOT NULL,
    cantidad_stock INT NOT NULL,
    estado TINYINT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);


CREATE TABLE compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente VARCHAR(20),
    fecha DATETIME NOT NULL,
    medio_pago CHAR(1) NOT NULL,
    comentario VARCHAR(300),
    estado CHAR(1) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);


CREATE TABLE compras_productos (
    id_compra INT,
    id_producto INT,
    cantidad INT NOT NULL,
    total DECIMAL(16,2) NOT NULL,
    estado TINYINT NOT NULL,
    PRIMARY KEY (id_compra, id_producto),
    FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
