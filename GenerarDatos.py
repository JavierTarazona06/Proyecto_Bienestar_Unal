import csv
import pandas as pd
import random

num = random.randint(1, 500)

nombres = ['Juan', 'Carlos', 'Luis', 'Mario', 'Pedro', 'Alejandro', 'Diego', 'Fernando', 'Andrés', 'Jorge',           'Ana', 'María', 'Isabel', 'Carla', 'Lucía', 'Andrea', 'Natalia', 'Mónica', 'Gabriela', 'Laura',           'Manuel', 'José', 'Miguel', 'Raúl', 'Santiago', 'Felipe', 'Gustavo', 'Roberto', 'Ernesto', 'Ricardo']

apellidos = ['García', 'Rodríguez', 'Hernández', 'González', 'Martínez', 'López', 'Pérez', 'Sánchez', 'Ramírez', 'Torres',             'Vargas', 'Romero', 'Suárez', 'Castro', 'Álvarez', 'Fernández', 'Ruiz', 'Gómez', 'Díaz', 'Mendoza',             'Cruz', 'Ortiz', 'Reyes', 'Núñez', 'Morales', 'Jiménez', 'Chávez', 'Flores', 'Silva', 'Rojas']

dir_carrera = ["KR","CL","TV","AK","AC"]

letras = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

# Lista de 50 barrios de Colombia
barrios_colombia = ['La Candelaria', 'San Diego', 'El Poblado', 'Laureles', 'Envigado', 'Belén', 'Estadio', 'Manrique', 'Robledo', 'Buenos Aires', 'Guayabal', 'El Centro', 'Bello', 'La América', 'Castilla', 'Doce de Octubre', 'Aranjuez', 'La Floresta', 'Itagüí', 'Cristo Rey', 'El Chagualo', 'El Salado', 'El Popular', 'Manila', 'Los Colores', 'El Tesoro', 'La Mota', 'El Pinal', 'Barrio Colombia', 'Loma de Los Bernal', 'El Rodeo', 'Moravia', 'Santa Cruz', 'San Javier', 'El Lido', 'La Avanzada', 'La Aguacatala', 'El Raizal', 'La Castellana', 'La Estrella', 'San Joaquín', 'El Diamante', 'Campo Valdés', 'Laureano Gómez', 'San Antonio', 'La Francia', 'Las Acacias', 'La Flora', 'San Lucas', 'La Pradera']

# Lista de 10 ciudades de Colombia
ciudades_colombia = ['Bogotá', 'Medellín', 'Cali', 'Barranquilla', 'Cartagena', 'Cúcuta', 'Soacha', 'Ibagué', 'Bucaramanga', 'Villavicencio']

tiposVivienda = ["Casa", "Apartamento", "Apartaestudio", "Finca"]

localidades = ['Usaquén', 'Chapinero', 'Santa Fe', 'San Cristóbal', 'Usme', 'Tunjuelito', 'Bosa', 'Kennedy', 'Fontibón', 'Engativá', 'Suba', 'Barrios Unidos', 'Teusaquillo', 'Los Mártires', 'Antonio Nariño', 'Puente Aranda', 'La Candelaria', 'Rafael Uribe Uribe', 'Ciudad Bolívar','Otra']

eps_colombia = ["SaludTotal", "Coomeva EPS", "Sura EPS", "Compensar", "Nueva EPS", "Famisanar", "Sanitas", "EPS Familiar", "Aliansalud", "Cafesalud", "Colmedica"]

sedes_unal = ['Bogotá', 'Medellín', 'Manizales', 'Palmira', 'Amazonia',"Caribe","De La Paz","Orinoquia","Tumaco"]

facultades_unal = ['Artes', 'Ciencias', 'Ciencias Agrarias', 'Ciencias Económicas', 'Ciencias Humanas', 'Ciencias Veterinarias y de Zootecnia', 'Derecho, Ciencias Políticas y Sociales', 'Enfermería', 'Ingeniería', 'Medicina', 'Odontología', 'Psicología']

procedencias = ["PEAMA","Regular"]

class Persona:
    def __init__(self) -> None:
        nombre1 = nombres[random.randint(0,200)%30]
        nombre2 = nombres[random.randint(0,200)%30]
        self.nombre = str(nombre1)+" "+str(nombre2)
        apellido1 = apellidos[random.randint(0,200)%30]
        apellido2 = apellidos[random.randint(0,200)%30]
        self.apellido = str(apellido1)+" "+str(apellido2)
        self.direccion = dir_carrera[random.randint(0,100)%5]+" "+str(random.randint(1,180))+" "+letras[random.randint(0,100)%20]+" No. "+str(random.randint(1,99))+"-"+str(random.randint(1,99))
        self.barrio = barrios_colombia[random.randint(0,200)%50]
        self.ciudad = ciudades_colombia[random.randint(0,200)%10]
        self.viv = tiposVivienda[random.randint(0,200)%4]
        self.localidad = localidades[random.randint(0,200)%20]
        self.email = nombre1[0]+apellido1+apellido2[0]+"@unal.edu.co"
        self.entidadSalud = eps_colombia[random.randint(0,200)%11]
        self.procedencia = ""
        self.sede = sedes_unal[random.randint(0,200)%9]
        self.facultad = facultades_unal[random.randint(0,200)%12]

    def __str__(self) -> str:
        return self.nombre+" "+self.apellido+" "+ self.direccion+" "+self.barrio+" "+self.ciudad+" "+ self.viv+" "+self.localidad+" "+self.email+" "+self.entidadSalud+" "+self.procedencia+" "+self.sede+" "+self.facultad

for i in range(30):
    p1 = Persona()
    print(f"insert into persona (perNombre,perApellido,perDireccion,perBarrio,perCiudad,perTipoVivienda,perLocalidad,perEmail,perEntidadSalud,perFacultad) values ('{p1.nombre}','{p1.apellido}','{p1.direccion}','{p1.barrio}','{p1.ciudad}','{p1.viv}','{p1.localidad}','{p1.email}','{p1.entidadSalud}','{p1.facultad}');")

'''
with open('datos.csv', 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(['header1', 'header2', 'header3']) # agregar encabezados de columna

data = {'header1': ['value1', 'value2', 'value3'], 'header2': ['value4', 'value5', 'value6'], 'header3': ['value7', 'value8', 'value9']}
df = pd.DataFrame(data)

with open('file.csv', 'a', newline='') as f:
    df.to_csv(f, header=False, index=True)
    '''