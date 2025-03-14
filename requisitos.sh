sqlite3 mediciones.db < init.sql

function agregar_paciente {
    read -p "Ingresa el nombre del paciente: " nombre
    read -p "Ingresa la edad del paciente: " edad
    sqlite3 eeg.db "INSERT INTO Pacientes (nombre, edad) VALUES ('$nombre', $edad);"
    echo "Paciente agregado."
}

function agregar_medicion {
    read -p "Ingresa el ID del paciente: " paciente_id
    read -p "Ingresa el valor de delta: " delta
    read -p "Ingresa el valor de theta: " theta
    read -p "Ingresa el valor de alpha: " alpha
    read -p "Ingresa el valor de beta: " beta
    read -p "Ingresa el valor de gamma: " gamma
    read -p "Ingresa el valor de amplitud: " amplitud
    read -p "Ingresa notas adicionales (opcional): " notas
    sqlite3 eeg.db "INSERT INTO MedicionesEEG (paciente_id, delta, theta, alpha, beta, gamma, amplitud, notas_adicionales) VALUES ($paciente_id, $delta, $theta, $alpha, $beta, $gamma, $amplitud, '$notas');"
    echo "Medición agregada."
}

function obtener_mediciones_frecuencia {
    read -p "Ingresa el ID del paciente: " paciente_id
    read -p "Ingresa la frecuencia (delta, theta, alpha, beta, gamma): " frecuencia
    sqlite3 eeg.db "SELECT * FROM MedicionesEEG WHERE paciente_id = $paciente_id AND $frecuencia IS NOT NULL;"
}

function obtener_mediciones_amplitud {
    read -p "Ingresa el ID del paciente: " paciente_id
    read -p "Ingresa el valor de amplitud: " amplitud
    sqlite3 eeg.db "SELECT * FROM MedicionesEEG WHERE paciente_id = $paciente_id AND amplitud = $amplitud;"
}

function eliminar_medicion {
    read -p "Ingresa el ID de la medición a eliminar: " id
    sqlite3 eeg.db "DELETE FROM MedicionesEEG WHERE id = $id;"
    echo "Medición eliminada."
}

function mostrar_menu {
    echo ""
    echo "1. Agregar paciente"
    echo "2. Agregar medición"
    echo "3. Obtener mediciones de un paciente para una frecuencia dada"
    echo "4. Obtener mediciones de un paciente para una amplitud dada"
    echo "5. Eliminar una medición"
    echo "6. Salir"
    echo ""
    read -p "Elige una opción: " opcion

    case $opcion in
        1) agregar_paciente ;;
        2) agregar_medicion ;;
        3) obtener_mediciones_frecuencia ;;
        4) obtener_mediciones_amplitud ;;
        5) eliminar_medicion ;;
        6) exit 0 ;;
    esac
}

while true
do
    mostrar_menu
done