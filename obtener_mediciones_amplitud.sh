sqlite3 mediciones.db "SELECT * FROM Mediciones WHERE id_paciente = (SELECT id FROM Pacientes WHERE nombre = :nombre)
  AND amplitud BETWEEN :amplitud_min AND :amplitud_max";

