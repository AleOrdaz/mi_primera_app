<?php
/*
    1. definir el json o respuesta
        {
            estatus: 200, 404, 400, 500,
            total_De_informacion: 0,
            [
                {
                    nombre: "",
                    aplledidos: "",
                    edad: 0,
                    nacionalidad: "",
                    amigos: [],
                },
                {...}
            ]
        }

    2. Construir o acceder a la información
    3. Crear el código
*/

//arreglos para la información
$nombres = ["Alejandro", "Mayra", " Luis", "Ana"];
$apellidos = ["Ramírez López", "Gómez Fernández", "Miller", "Santos Rivera", "Torres Díaz"];
$edades = [28, 31, 24, 35, 26];
$nacionalidades = ["México", "España", "Estados Unidos", "Colombia", "Chile"];
$amigos = [
    ["Alejandro", "Mayra"],
    ["Alejandro", "Mayra", " Luis"],
    [" Luis", "Ana"],
];

$usuarios = [];
$estatus = 200;
$n = Rand(0,1);
if($n==1){
    //Creamos la respuesta
    for($i = 0; $i < count($nombres); $i++) {
        $usuarios[] = [
            "nombre" => $nombres[$i],
            "apellido" => $apellidos[$i],
            "edad" => $edades[$i],
            "nacionalidad" => $nacionalidades[$i],
            "amigos" => count($amigos) <$i ? $amigos[$i] : []
        ];
    }
} else {
    //Regresamos el error
    $estatus = 404; // error de conexión
}

$json = [
    "status" => $estatus,
    "total" => count($usuarios),
    "usuarios" => $usuarios
];
?>
