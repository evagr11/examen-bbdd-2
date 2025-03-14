sqlite3 mediciones.db "INSERT INTO Mediciones(id_paciente, delta, theta, alpha, beta, gamma, amplitud, notas)
SELECT id, :delta, :theta, :alpha, :beta, :gamma, :amplitud, :notas FROM Pacientes WHERE nombre = :nombre;"
