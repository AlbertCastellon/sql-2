/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    edad INT
)

-- PASO 2
-- Tu código aquí
CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
)

-- PASO 3
-- Tu código aquí
ALTER TABLE usuarios ADD id_rol INT;

-- PASO 4
-- Tu código aquí
SELECT usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol FROM usuarios 
INNER JOIN roles ON usuarios.id_rol = roles.id_rol

/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
)

-- PASO 2
-- Tu código aquí
ALTER TABLE usuarios ADD id_categoria INT;

-- PASO 3
-- Tu código aquí
UPDATE usuarios SET id_categoria = 1 WHERE id IN (1, 5);
UPDATE usuarios SET id_categoria = 2 WHERE id IN (2, 6, 10);
UPDATE usuarios SET id_categoria = 3 WHERE id IN (3, 11, 16);
UPDATE usuarios SET id_categoria = 4 WHERE id IN (4, 7, 8, 12);
UPDATE usuarios SET id_categoria = 5 WHERE id IN (9);
UPDATE usuarios SET id_categoria = 6 WHERE id IN (13, 17);
UPDATE usuarios SET id_categoria = 7 WHERE id IN (14);
UPDATE usuarios SET id_categoria = 8 WHERE id IN (19);
UPDATE usuarios SET id_categoria = 9 WHERE id IN (15, 18);
UPDATE usuarios SET id_categoria = 10 WHERE id IN (20);

-- PASO 4
-- Tu código aquí
SELECT usuarios.id, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria 
FROM usuarios 
INNER JOIN roles ON usuarios.id_rol = roles.id_rol
INNER JOIN categorias ON usuarios.id_categoria = categorias.id_categoria

/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios_categorias (
    id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_categoría INT
)
ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_categoría) REFERENCES categorias(id)
ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_categoría) REFERENCES categorias(id_categoria)
-- PASO 2
-- Tu código aquí
INSERT INTO usuarios_categorias (id_usuario, id_categoría) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10);

-- PASO 3
-- Tu código aquí
SELECT usuarios.id, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad,
roles.nombre_rol, categorias.nombre_categoria 
FROM usuarios 
INNER JOIN roles ON usuarios.id_rol = roles.id_rol
INNER JOIN usuarios_categorias ON usuarios.id = usuarios_categorias.id_usuario
INNER JOIN categorias ON usuarios_categorias.id_categoría = categorias.id_categoria