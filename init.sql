--- Crear tabla de pacientes
CREATE TABLE IF NOT EXISTS Pacientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE,
    edad INTEGER NOT NULL
);

SELECT * FROM Pacientes;

-- Crear tabla de mediciones
CREATE TABLE IF NOT EXISTS Mediciones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_paciente INTEGER NOT NULL,
    delta INTEGER,
    theta INTEGER,
    alpha INTEGER,
    beta INTEGER,
    gamma INTEGER,
    amplitud INTEGER,
    notas TEXT,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id)
);

SELECT * FROM Mediciones;

-- Insertar pacientes de ejemplo
INSERT INTO Pacientes (nombre, edad) VALUES
('Carlos Pérez', 25),
('Ana López', 30),
('Miguel Gómez', 35);

SELECT * FROM Pacientes;


-- Insertar mediciones de ejemplo
INSERT INTO Mediciones (id_paciente, delta, theta, alpha, beta, gamma, amplitud, notas) VALUES
(1, 3, 4, 8, 13, 35, 75, "Sueño ligero"),
(1, 3, 4, 9, 14, 45, 80, "En reposo"),
(2, 2, 4, 7, 12, 40, 72, "Relajación"),
(3, 3, 4, 8, 13, 38, 78, "Concentración");

SELECT * FROM Mediciones;
