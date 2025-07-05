CREATE DATABASE IF NOT EXISTS delivery_db;
USE delivery_db;

-- Tabla de usuarios
CREATE TABLE usuario (
    ID_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    direccion VARCHAR(255) NOT NULL
);

-- Tabla de restaurantes
CREATE TABLE restaurante (
    ID_restaurante INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

-- Tabla de productos
CREATE TABLE productos (
    ID_productos INT PRIMARY KEY AUTO_INCREMENT,
    ID_restaurante INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID_restaurante)
);

-- Tabla de pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    restaurante_id INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) DEFAULT 'Pendiente',
    FOREIGN KEY (usuario_id) REFERENCES usuario(ID_usuario),
    FOREIGN KEY (restaurante_id) REFERENCES restaurante(ID_restaurante)
);

-- Tabla de detalles del pedido
CREATE TABLE detalles_pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10 , 2 ) NOT NULL,
    FOREIGN KEY (pedido_id)
        REFERENCES pedidos (id),
    FOREIGN KEY (producto_id)
        REFERENCES productos (ID_productos)
);
