-- Crear tabla de Usuarios
CREATE TABLE Usuario (
    ID_Usuario INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Correo NVARCHAR(100) NOT NULL UNIQUE,
    Contraseña NVARCHAR(255) NOT NULL,
    Fecha_Registro DATETIME DEFAULT GETDATE()
);

-- Crear tabla de Repositorios
CREATE TABLE Repositorio (
    ID_Repositorio INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Fecha_Creacion DATETIME DEFAULT GETDATE(),
    ID_Usuario INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

-- Crear tabla de Archivos
CREATE TABLE Archivo (
    ID_Archivo INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(255) NOT NULL,
    Tipo VARCHAR(50),
    Tamaño FLOAT,
    Fecha_Subida DATETIME DEFAULT GETDATE(),
    Publico BIT DEFAULT 0,
    Ruta VARCHAR(500),
    ID_Usuario INT NOT NULL,
    ID_Repositorio INT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY (ID_Repositorio) REFERENCES Repositorio(ID_Repositorio)
);

-- Crear tabla de Compartición
CREATE TABLE Comparticion (
    ID_Comparticion INT PRIMARY KEY IDENTITY(1,1),
    ID_Archivo INT NOT NULL,
    ID_Usuario_Destino INT NOT NULL,
    Fecha_Comparticion DATETIME DEFAULT GETDATE(),
    Caducidad DATETIME NULL,
    Contraseña VARCHAR(255) NULL,
    FOREIGN KEY (ID_Archivo) REFERENCES Archivo(ID_Archivo),
    FOREIGN KEY (ID_Usuario_Destino) REFERENCES Usuario(ID_Usuario)
);
