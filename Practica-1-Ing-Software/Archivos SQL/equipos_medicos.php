<?php
/* 
API específica para EQUIPOS MÉDICOS
*/
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET,POST,PUT,DELETE");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

/* Conexión a la base de datos */
$servidor = "localhost"; 
$usuario = "root"; 
$passwd = ""; 
$nombreBaseDatos = "hce";
$conexionBD = new mysqli($servidor, $usuario, $passwd, $nombreBaseDatos);

// Verificar conexión
if ($conexionBD->connect_error) {
    die(json_encode(["error" => "Error de conexión: " . $conexionBD->connect_error]));
}

// -------------------------- EQUIPOS MÉDICOS ------------------

// Consultar por ID
if (isset($_GET["consultar"])) {
    $id = intval($_GET["consultar"]);
    $sqlEquipo = mysqli_query($conexionBD,"
        SELECT e.*,
               u.nombre AS ubicacion_nombre,
               CONCAT(r.nombre,' ',r.apellido) AS responsable_nombre
        FROM equipos_medicos e
        LEFT JOIN ubicaciones u ON e.ubicacion=u.id
        LEFT JOIN responsables r ON e.responsable=r.id
        WHERE e.id=$id
    ");
    if (mysqli_num_rows($sqlEquipo) > 0) {
        $equipo = mysqli_fetch_all($sqlEquipo, MYSQLI_ASSOC);
        echo json_encode($equipo);
        exit();
    } else {
        echo json_encode(["success" => 0, "message" => "Equipo médico no encontrado"]);
        exit();
    }
}

// Consultar por código
if (isset($_GET["consultarCod"])) {
    $codigo = mysqli_real_escape_string($conexionBD, $_GET["consultarCod"]);
    $sqlEquipo = mysqli_query($conexionBD,"
        SELECT e.*,
               u.nombre AS ubicacion_nombre,
               CONCAT(r.nombre,' ',r.apellido) AS responsable_nombre
        FROM equipos_medicos e
        LEFT JOIN ubicaciones u ON e.ubicacion=u.id
        LEFT JOIN responsables r ON e.responsable=r.id
        WHERE e.codigo='$codigo'
    ");
    if (mysqli_num_rows($sqlEquipo) > 0) {
        $equipo = mysqli_fetch_assoc($sqlEquipo);
        echo json_encode($equipo);
        exit();
    } else {
        echo json_encode(["success" => 0, "message" => "Equipo médico no encontrado"]);
        exit();
    }
}

// Borrar por ID
if (isset($_GET["borrar"])) {
    $id = intval($_GET["borrar"]);
    $sqlEquipo = mysqli_query($conexionBD,"DELETE FROM equipos_medicos WHERE id=$id");
    if ($sqlEquipo) {
        echo json_encode(["success" => 1, "message" => "Equipo médico eliminado correctamente"]);
    } else {
        echo json_encode(["success" => 0, "message" => "Error al eliminar equipo médico"]);
    }
    exit();
}

// Insertar nuevo equipo médico
if (isset($_GET["insertar"])) {
    $data = json_decode(file_get_contents("php://input"));
    
    if (!$data) {
        echo json_encode(["success" => 0, "message" => "Datos no válidos"]);
        exit();
    }
    
    $codigo = mysqli_real_escape_string($conexionBD, $data->codigo);
    $nombre = mysqli_real_escape_string($conexionBD, $data->nombre);
    $marca = mysqli_real_escape_string($conexionBD, $data->marca);
    $modelo = mysqli_real_escape_string($conexionBD, $data->modelo);
    $serial = mysqli_real_escape_string($conexionBD, $data->serial);
    $ubicacion = intval($data->ubicacion);      // guardamos id
    $responsable = intval($data->responsable);  // guardamos id
    
    if($codigo && $nombre && $marca && $modelo && $serial && $ubicacion && $responsable) {
        $sqlEquipo = mysqli_query($conexionBD,"
            INSERT INTO equipos_medicos(codigo, nombre, marca, modelo, serial, ubicacion, responsable)
            VALUES('$codigo','$nombre','$marca','$modelo','$serial',$ubicacion,$responsable)
        ");
        if ($sqlEquipo) {
            echo json_encode(["success" => 1, "message" => "Equipo médico creado correctamente"]);
        } else {
            echo json_encode(["success" => 0, "message" => "Error al crear equipo médico"]);
        }
    } else {
        echo json_encode(["success" => 0, "message" => "Todos los campos son obligatorios"]);
    }
    exit();
}

// Actualizar equipo médico existente
if (isset($_GET["actualizar"])) { 
    $data = json_decode(file_get_contents("php://input"));
    
    if (!$data) {
        echo json_encode(["success" => 0, "message" => "Datos no válidos"]);
        exit();
    }
    
    $id = isset($data->id) ? intval($data->id) : intval($_GET["actualizar"]);
    $codigo = mysqli_real_escape_string($conexionBD, $data->codigo);
    $nombre = mysqli_real_escape_string($conexionBD, $data->nombre);
    $marca = mysqli_real_escape_string($conexionBD, $data->marca);
    $modelo = mysqli_real_escape_string($conexionBD, $data->modelo);
    $serial = mysqli_real_escape_string($conexionBD, $data->serial);
    $ubicacion = intval($data->ubicacion);
    $responsable = intval($data->responsable);
    
    $sqlEquipo = mysqli_query($conexionBD,"
        UPDATE equipos_medicos
        SET codigo='$codigo',
            nombre='$nombre',
            marca='$marca',
            modelo='$modelo',
            serial='$serial',
            ubicacion=$ubicacion,
            responsable=$responsable
        WHERE id=$id
    ");
    if ($sqlEquipo) {
        echo json_encode(["success" => 1, "message" => "Equipo médico actualizado correctamente"]);
    } else {
        echo json_encode(["success" => 0, "message" => "Error al actualizar equipo médico"]);
    }
    exit();
}

// LISTAR TODOS LOS EQUIPOS MÉDICOS (Por defecto)
$sqlEquipos = mysqli_query($conexionBD,"
    SELECT e.id, e.codigo, e.nombre, e.marca, e.modelo, e.serial,
           e.ubicacion, u.nombre AS ubicacion_nombre,
           e.responsable, CONCAT(r.nombre,' ',r.apellido) AS responsable_nombre
    FROM equipos_medicos e
    LEFT JOIN ubicaciones u ON e.ubicacion = u.id
    LEFT JOIN responsables r ON e.responsable = r.id
    ORDER BY e.marca ASC, e.modelo ASC
");

if(mysqli_num_rows($sqlEquipos) > 0){
    $equipos = mysqli_fetch_all($sqlEquipos, MYSQLI_ASSOC);
    echo json_encode($equipos);
} else { 
    echo json_encode([]); // Array vacío si no hay equipos
}

// Cerrar conexión
$conexionBD->close();
?>