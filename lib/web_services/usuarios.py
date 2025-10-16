import json

# Arreglos base
nombres = ["Carlos", "Lucía", "Thomas", "María", "Ana"]
apellidos = ["Ramírez López", "Gómez Fernández", "Miller", "Santos Rivera", "Torres Díaz"]
edades = [28, 31, 24, 35, 26]
nacionalidades = ["México", "España", "Estados Unidos", "Colombia", "Chile"]

amigos = [
    ["Ana", "Luis", "Pedro"],
    ["Carlos", "María", "José"],
    ["Lucía", "John"],
    ["Lucía", "Carlos"],
    ["María", "Thomas"]
]

# Construcción dinámica de usuarios
usuarios = []
for i in range(len(nombres)):
    usuarios.append({
        "nombre": nombres[i],
        "apellidos": apellidos[i],
        "edad": edades[i],
        "nacionalidad": nacionalidades[i],
        "amigos": amigos[i]
    })

# JSON final
json_data = {
    "status": "success",
    "total_usuarios": len(usuarios),
    "data": usuarios
}

print(json.dumps(json_data, indent=4, ensure_ascii=False))