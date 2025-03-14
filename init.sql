CREATE TABLE IF NOT EXISTS Pacientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    edad INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Mediciones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    paciente_id INTEGER NOT NULL,
    delta FLOAT,
    theta INTEGER,
    alpha INTEGER,
    beta INTEGER,
    gamma INTEGER,
    amplitud FLOAT,
    notas_adicionales TEXT,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(id)
);
