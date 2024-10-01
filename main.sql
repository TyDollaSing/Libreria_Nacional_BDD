-- Creación de la Base de Datos
CREATE DATABASE LibreriaNacional;
USE LibreriaNacional;

-- Creación de la tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    ciudad VARCHAR(100)
);

-- Creación de la tabla Proveedores
CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Creación de la tabla Libros
CREATE TABLE Libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100),
    editorial VARCHAR(100),
    anio_publicacion INT,
    precio DECIMAL(10, 2),
    cantidad_disponible INT,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Creación de la tabla Ventas
CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_libro INT,
    fecha_venta DATE,
    cantidad INT,
    total_venta DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creación de la tabla Eventos
CREATE TABLE Eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_evento VARCHAR(150) NOT NULL,
    descripcion TEXT,
    fecha_evento DATE,
    ubicacion VARCHAR(200)
);

-- Creación de la tabla Tendencias Editoriales
CREATE TABLE Tendencias_Editoriales (
    id_tendencia INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creación de la tabla Bonos Financieros
CREATE TABLE Bonos_Financieros (
    id_bono INT AUTO_INCREMENT PRIMARY KEY,
    codigo_bono VARCHAR(50),
    valor DECIMAL(10, 2),
    fecha_expiracion DATE,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (nombre, apellido, email, telefono, direccion, ciudad)
VALUES 
('Carlos', 'Perez', 'carlos.perez@example.com', '3001234567', 'Calle 10 # 5-60', 'Bogotá'),
('Ana', 'García', 'ana.garcia@example.com', '3017654321', 'Carrera 15 # 2-45', 'Medellín'),
('Luis', 'Martínez', 'luis.martinez@example.com', '3023456789', 'Calle 100 # 20-30', 'Cali'),
('Laura', 'Ramirez', 'laura.ramirez@example.com', '3005678901', 'Calle 45 # 20-15', 'Barranquilla'),
('Juan', 'Fernandez', 'juan.fernandez@example.com', '3012345678', 'Calle 80 # 10-40', 'Cartagena');

-- Insertar datos en la tabla Proveedores
INSERT INTO Proveedores (nombre, contacto, telefono, email)
VALUES 
('Editorial Planeta', 'María Gómez', '3109876543', 'maria.gomez@planeta.com'),
('Penguin Random House', 'Carlos López', '3106543210', 'carlos.lopez@penguin.com'),
('HarperCollins', 'Sofia Martinez', '3201234567', 'sofia.martinez@harpercollins.com'),
('Santillana', 'Pedro Ruiz', '3198765432', 'pedro.ruiz@santillana.com'),
('Norma Editorial', 'Andres Gomez', '3187654321', 'andres.gomez@norma.com');

-- Insertar datos en la tabla Libros
INSERT INTO Libros (titulo, autor, editorial, anio_publicacion, precio, cantidad_disponible, id_proveedor)
VALUES 
('Cien años de soledad', 'Gabriel García Márquez', 'Editorial Planeta', 1967, 50000, 100, 1),
('1984', 'George Orwell', 'Penguin Random House', 1949, 45000, 50, 2),
('El Alquimista', 'Paulo Coelho', 'HarperCollins', 1988, 35000, 75, 3),
('La sombra del viento', 'Carlos Ruiz Zafón', 'Editorial Planeta', 2001, 60000, 40, 1),
('El Principito', 'Antoine de Saint-Exupéry', 'Penguin Random House', 1943, 30000, 120, 2);

-- Insertar datos en la tabla Ventas
INSERT INTO Ventas (id_cliente, id_libro, fecha_venta, cantidad, total_venta)
VALUES 
(1, 1, '2024-09-25', 1, 50000),
(2, 2, '2024-09-26', 2, 90000),
(3, 3, '2024-09-27', 1, 35000),
(4, 4, '2024-09-28', 3, 180000),
(5, 5, '2024-09-29', 2, 60000);

-- Insertar datos en la tabla Eventos
INSERT INTO Eventos (nombre_evento, descripcion, fecha_evento, ubicacion)
VALUES 
('Feria del Libro 2024', 'Feria anual de libros en Bogotá', '2024-10-15', 'Corferias, Bogotá'),
('Café Literario', 'Conversatorio sobre literatura contemporánea', '2024-11-01', 'Librería Nacional - Cali'),
('Charla con autores', 'Encuentro con escritores colombianos', '2024-12-05', 'Librería Nacional - Medellín'),
('Taller de Escritura Creativa', 'Taller para aspirantes a escritores', '2024-11-20', 'Librería Nacional - Bogotá'),
('Presentación de libros', 'Lanzamiento de nuevas publicaciones', '2024-10-25', 'Librería Nacional - Barranquilla');

-- Insertar datos en la tabla Tendencias Editoriales
INSERT INTO Tendencias_Editoriales (id_libro, fecha_inicio, fecha_fin)
VALUES 
(1, '2024-09-01', '2024-09-30'),
(2, '2024-09-15', '2024-10-15'),
(3, '2024-10-01', '2024-10-31'),
(4, '2024-11-01', '2024-11-30'),
(5, '2024-12-01', '2024-12-31');

-- Insertar datos en la tabla Bonos Financieros
INSERT INTO Bonos_Financieros (codigo_bono, valor, fecha_expiracion, id_cliente)
VALUES 
('BONO2024', 10000, '2024-12-31', 1),
('PROMO2024', 15000, '2024-11-30', 2),
('DESCUENTO50', 5000, '2024-10-31', 3),
('BONOLIBROS', 20000, '2024-12-15', 4),
('BONOESPECIAL', 30000, '2024-12-31', 5);
