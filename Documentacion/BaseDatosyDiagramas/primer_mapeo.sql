CREATE DATABASE revista;

USE revista;

CREATE TABLE autor(
nom_usuario VARCHAR(45) PRIMARY KEY NOT NULL,
passwor VARCHAR(45),
foto BLOB,
descripcion_personal VARCHAR(150),
descripcion_hobbies VARCHAR(150)
);

CREATE TABLE etiqueta_autor(
id_etiqueta_autor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nombre_etiqueta VARCHAR(45),
nom_usuario VARCHAR(45),
FOREIGN KEY (nom_usuario) REFERENCES autor(nom_usuario)
);

CREATE TABLE estado_admin(
id_estado_admin INT PRIMARY KEY,
nombre_estado VARCHAR(45)
);

CREATE TABLE administrador(
nombre_usuario VARCHAR(45) PRIMARY KEY,
passwor VARCHAR(45),
id_estado_admin INT,
FOREIGN KEY(id_estado_admin) REFERENCES estado_admin(id_estado_admin)
);

CREATE TABLE porcentaje_soft(
id_porcentaje_soft INT PRIMARY KEY,
porcentaje DECIMAL(7,2),
fecha_ultima_modificacion DATE,
nombre_usuario VARCHAR(45),
FOREIGN KEY (nombre_usuario) REFERENCES administrador(nombre_usuario)
);

CREATE TABLE estado_revista(
id_estado_revista INT PRIMARY KEY,
nombre_estado VARCHAR(45)
);

CREATE TABLE revista(
id_revista INT AUTO_INCREMENT PRIMARY KEY,
nombre_revista VARCHAR(45),
fecha_publicacion DATE,
descripcion VARCHAR(150),
costo_dia DECIMAL(7,2),
valor_suscripcion DECIMAL(7,2),
archivo BLOB,
id_estado_revista INT,
nombre_usuario VARCHAR(45),
FOREIGN KEY (id_estado_revista) REFERENCES estado_revista(id_estado_revista),
FOREIGN KEY (nombre_usuario) REFERENCES administrador(nombre_usuario)
);


CREATE TABLE etiqueta_revista(
id_etiqueta_revista INT AUTO_INCREMENT PRIMARY KEY,
nombre_etiqueta VARCHAR(45),
id_revista INT,
FOREIGN KEY (id_revista) REFERENCES revista(id_revista)
);

CREATE TABLE estado_suscripcion(
id_estado_suscripcion INT PRIMARY KEY,
nombre_estado VARCHAR(45)
);

CREATE TABLE suscripcion(
id_suscripcion INT AUTO_INCREMENT PRIMARY KEY,
valor_suscripcion DECIMAL(7,2),
fecha_inicio DATE,
fecha_final DATE,
id_revista INT,
nom_usuario VARCHAR(45),
id_estado_suscripcion INT,
FOREIGN KEY (id_revista) REFERENCES revista(id_revista),
FOREIGN KEY (nom_usuario) REFERENCES autor(nom_usuario),
FOREIGN KEY (id_estado_suscripcion) REFERENCES estado_suscripcion(id_estado_suscripcion)
);

CREATE TABLE comentario(
id_comentario INT AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(150),
fecha DATE,
id_revista INT,
nom_usuario VARCHAR(45),
FOREIGN KEY (id_revista) REFERENCES revista(id_revista),
FOREIGN KEY (nom_usuario) REFERENCES autor(nom_usuario)
);

CREATE TABLE estado_anuncio(
id_estado_anuncio INT PRIMARY KEY,
nombre_estado VARCHAR(45)
);

CREATE TABLE anunciante(
id_anunciante INT PRIMARY KEY,
nombre_anunciante VARCHAR(45),
caracteristicas_anunciante VARCHAR(45)
);

CREATE TABLE anuncio(
id_anuncio INT AUTO_INCREMENT PRIMARY KEY,
nombre_anuncio VARCHAR(45),
costo_total DECIMAL(7,2),
fecha_inicio DATE,
fecha_final DATE,
url VARCHAR(100),
nom_usuario VARCHAR(45),
id_anunciante INT,
id_estado_anuncio INT,
id_revista INT,
FOREIGN KEY (nom_usuario) REFERENCES autor(nom_usuario),
FOREIGN KEY (id_anunciante) REFERENCES anunciante(id_anunciante),
FOREIGN KEY (id_estado_anuncio) REFERENCES estado_anuncio(id_estado_anuncio),
FOREIGN KEY (id_revista) REFERENCES revista(id_revista)
);

CREATE TABLE etiqueta_anuncio(
id_etiqueta_anuncio INT AUTO_INCREMENT PRIMARY KEY,
nombre_etiqueta VARCHAR(45),
id_anuncio INT,
FOREIGN KEY (id_anuncio) REFERENCES anuncio(id_anuncio)
);

CREATE TABLE recaudacion(
id_recaudacion INT AUTO_INCREMENT PRIMARY KEY,
total_recaudado DECIMAL(7,2),
total_soft DECIMAL(7,2),
total_editor DECIMAL(7,2),
ganancia DECIMAL(7,2),
nom_usuario VARCHAR(45),
id_porcentaje INT,
id_suscripcion INT,
FOREIGN KEY (nom_usuario) REFERENCES autor(nom_usuario),
FOREIGN KEY (id_porcentaje) REFERENCES porcentaje_soft(id_porcentaje_soft),
FOREIGN KEY (id_suscripcion) REFERENCES suscripcion(id_suscripcion)
);










