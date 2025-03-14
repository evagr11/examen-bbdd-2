import sqlite3

conn = sqlite3.connect('mediciones.db')
c = conn.cursor()

def create_tables():
    with open("init.sql", "r") as f:
        c.executescript(f.read())
    conn.commit()

def agregar_paciente(nombre, edad):
    c.execute("INSERT INTO Pacientes (nombre, edad) VALUES (?, ?)", (nombre, edad))
    conn.commit()

def agregar_medicion(paciente_id, delta, theta, alpha, beta, gamma, amplitud, notas):
    c.execute('''
        INSERT INTO Mediciones (paciente_id, delta, theta, alpha, beta, gamma, amplitud, notas_adicionales)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ''', (paciente_id, delta, theta, alpha, beta, gamma, amplitud, notas))
    conn.commit()

def obtener_mediciones(paciente_id):
    c.execute('''
        SELECT * FROM Mediciones WHERE paciente_id = ?
    ''', (paciente_id,))
    return c.fetchall()

def obtener_mediciones_frecuencia(paciente_id, frecuencia):
    c.execute(f'''
        SELECT * FROM Mediciones WHERE paciente_id = ? AND {frecuencia} IS NOT NULL
    ''', (paciente_id,))
    return c.fetchall()

def obtener_mediciones_amplitud(paciente_id, amplitud):
    c.execute('''
        SELECT * FROM Mediciones WHERE paciente_id = ? AND amplitud = ?
    ''', (paciente_id, amplitud))
    return c.fetchall()

def eliminar_medicion(id):
    c.execute('''
        DELETE FROM Mediciones WHERE id = ?
    ''', (id,))
    conn.commit()

def mostrar_mediciones(paciente_id):
    print("ID | Paciente ID | Delta | Theta | Alpha | Beta | Gamma | Amplitud | Notas | Fecha y Hora")
    for medicion in obtener_mediciones(paciente_id):
        linea = f"{medicion[0]} | {medicion[1]} | {medicion[2]} | {medicion[3]} | {medicion[4]} | {medicion[5]} | {medicion[6]} | {medicion[7]} | {medicion[8]} | {medicion[9]}"
        print(linea)

create_tables()

while True:
    print("")
    print("1. Agregar paciente")
    print("2. Agregar medición")
    print("3. Listar mediciones de un paciente")
    print("4. Obtener mediciones de un paciente para una frecuencia dada")
    print("5. Obtener mediciones de un paciente para una amplitud dada")
    print("6. Eliminar una medición")
    print("7. Salir")
    print("")

    opcion = input("Elige una opción: ")

    if opcion == "1":
        nombre = input("Ingresa el nombre del paciente: ")
        edad = input("Ingresa la edad del paciente: ")
        agregar_paciente(nombre, edad)

    elif opcion == "2":
        paciente_id = int(input("Ingresa el ID del paciente: "))
        delta = float(input("Ingresa el valor de delta: "))
        theta = float(input("Ingresa el valor de theta: "))
        alpha = float(input("Ingresa el valor de alpha: "))
        beta = float(input("Ingresa el valor de beta: "))
        gamma = float(input("Ingresa el valor de gamma: "))
        amplitud = float(input("Ingresa el valor de amplitud: "))
        notas = input("Ingresa notas adicionales (opcional): ")
        agregar_medicion(paciente_id, delta, theta, alpha, beta, gamma, amplitud, notas)

    elif opcion == "3":
        paciente_id = int(input("Ingresa el ID del paciente: "))
        mostrar_mediciones(paciente_id)

    elif opcion == "4":
        paciente_id = int(input("Ingresa el ID del paciente: "))
        frecuencia = input("Ingresa la frecuencia (delta, theta, alpha, beta, gamma): ")
        mediciones = obtener_mediciones_frecuencia(paciente_id, frecuencia)
        for medicion in mediciones:
            print(medicion)

    elif opcion == "5":
        paciente_id = int(input("Ingresa el ID del paciente: "))
        amplitud = float(input("Ingresa el valor de amplitud: "))
        mediciones = obtener_mediciones_amplitud(paciente_id, amplitud)
        for medicion in mediciones:
            print(medicion)

    elif opcion == "6":
        id = int(input("Ingresa el ID de la medición a eliminar: "))
        eliminar_medicion(id)

    elif opcion == "7":
        break