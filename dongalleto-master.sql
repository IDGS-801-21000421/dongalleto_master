DROP DATABASE dongalleto;
CREATE DATABASE dongalleto;
USE dongalleto;

CREATE TABLE Galleta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) UNIQUE
);

CREATE TABLE Material (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) UNIQUE,
    unidad ENUM('kg', 'litro', 'g', 'pieza')
);

CREATE TABLE Proveedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) UNIQUE,
    email VARCHAR(255)
);

CREATE TABLE Produccion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    stock INT,
    estadoStock ENUM('COMPLETO', 'BAJO', 'AGOTADO'),
    estadoProduccion ENUM('Preparacion', 'Horneando', 'Listo') DEFAULT 'Listo',
    galletaId INT,
    FOREIGN KEY (galletaId) REFERENCES Galleta(id)
);

CREATE TABLE Inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    stock FLOAT,
    stockMinimo INT,
    estadoStock ENUM('COMPLETO', 'BAJO', 'AGOTADO'),
    materialId INT UNIQUE,
    FOREIGN KEY (materialId) REFERENCES Material(id)
);

CREATE TABLE Compra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    total FLOAT
);

CREATE TABLE DetalleCompra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    compraId INT,
    insumo VARCHAR(255),
    proveedores VARCHAR(255),
    cantidad INT,
    costoUnitario FLOAT,
    total FLOAT,
    FOREIGN KEY (compraId) REFERENCES Compra(id),
    FOREIGN KEY (insumo) REFERENCES Material(nombre),
    FOREIGN KEY (proveedores) REFERENCES Proveedor(nombre)
);

CREATE TABLE Ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    total FLOAT
);

CREATE TABLE DetalleVenta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ventaId INT,
    galletaId INT,
    cantidad INT,
    precioUnitario FLOAT,
    total FLOAT,
    FOREIGN KEY (ventaId) REFERENCES Ventas(id),
    FOREIGN KEY (galletaId) REFERENCES Galleta(id)
);

CREATE TABLE Merma (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    cantidad FLOAT,
    motivo VARCHAR(255),
    tipo ENUM('MateriaPrima', 'Galletas'),
    inventarioId INT,
    FOREIGN KEY (inventarioId) REFERENCES Inventario(id)
);