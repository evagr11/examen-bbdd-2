sqlite3 mediciones.db "SELECT id, :frecuencia FROM Mediciones WHERE id_paciente = (SELECT id FROM Pacientes WHERE nombre = :nombre)
  AND :frecuencia IS NOT NULL";