<?php
/* 
API específica para UBICACIONES
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

// -------------------------- UBICACIONES ------------------

// Consultar por ID
if (isset($_GET["consultar"])) {
    $id = intval($_GET["consultar"]);
    $sqlUbicacion = mysqli_query($conexionBD,"SELECT * FROM ubicaciones WHERE id=$id");
    if (mysqli_num_rows($sqlUbicacion) > 0) {
        $ubicacion = mysqli_fetch_all($sqlUbicacion, MYSQLI_ASSOC);
        echo json_encode($ubicacion); 
        exit();
    } else { 
        echo json_encode(["success" => 0, "message" => "Ubicación no encontrada"]); 
        exit();
    }
}

// Consultar por código
if (isset($_GET["consultarCod"])) {
    $codigo = mysqli_real_escape_string($conexionBD, $_GET["consultarCod"]);
    $sqlUbicacion = mysqli_query($conexionBD, "SELECT * FROM ubicaciones WHERE codigo='$codigo'");
    if (mysqli_num_rows($sqlUbicacion) > 0) {
        $ubicacion = mysqli_fetch_assoc($sqlUbicacion);
        echo json_encode($ubicacion);
        exit();
    } else { 
        echo json_encode(["success" => 0, "message" => "Ubicación no encontrada"]); 
        exit();
    }
}

// Borrar por ID
if (isset($_GET["borrar"])) {
    $id = intval($_GET["borrar"]);
    $sqlUbicacion = mysqli_query($conexionBD,"DELETE FROM ubicaciones WHERE id=$id");
    if ($sqlUbicacion) {
        echo json_encode(["success" => 1, "message" => "Ubicación eliminada correctamente"]);
    } else {
        echo json_encode(["success" => 0, "message" => "Error al eliminar ubicación"]);
    }
    exit();
}

// Insertar nueva ubicación
if (isset($_GET["insertar"])) {
    $data = json_decode(file_get_contents("php://input"));
    
    if (!$data) {
        echo json_encode(["success" => 0, "message" => "Datos no válidos"]);
        exit();
    }
    
    $codigo = mysqli_real_escape_string($conexionBD, $data->codigo);
    $nombre = mysqli_real_escape_string($conexionBD, $data->nombre);
    $ubicacion = mysqli_real_escape_string($conexionBD, $data->ubicacion);
    $telefono = mysqli_real_escape_string($conexionBD, $data->telefono);
    
    if(($codigo != "") && ($nombre != "") && ($ubicacion != "") && ($telefono != "")) {        
        $sqlUbicacion = mysqli_query($conexionBD,"INSERT INTO ubicaciones(codigo, nombre, ubicacion, telefono) VALUES('$codigo','$nombre','$ubicacion','$telefono')");
        if ($sqlUbicacion) {
            echo json_encode(["success" => 1, "message" => "Ubicación creada correctamente"]);
        } else {
            echo json_encode(["success" => 0, "message" => "Error al crear ubicación"]);
        }
    } else {
        echo json_encode(["success" => 0, "message" => "Todos los campos son obligatorios"]);
    }
    exit();
}

// Actualizar ubicación existente
if (isset($_GET["actualizar"])) { 
    $data = json_decode(file_get_contents("php://input"));
    
    if (!$data) {
        echo json_encode(["success" => 0, "message" => "Datos no válidos"]);
        exit();
    }
    
    $id = (isset($data->id)) ? intval($data->id) : intval($_GET["actualizar"]);
    $codigo = mysqli_real_escape_string($conexionBD, $data->codigo);
    $nombre = mysqli_real_escape_string($conexionBD, $data->nombre);
    $ubicacion = mysqli_real_escape_string($conexionBD, $data->ubicacion);
    $telefono = mysqli_real_escape_string($conexionBD, $data->telefono);
    
    $sqlUbicacion = mysqli_query($conexionBD,"UPDATE ubicaciones SET codigo='$codigo', nombre='$nombre', ubicacion='$ubicacion', telefono='$telefono' WHERE id='$id'");
    if ($sqlUbicacion) {
        echo json_encode(["success" => 1, "message" => "Ubicación actualizada correctamente"]);
    } else {
        echo json_encode(["success" => 0, "message" => "Error al actualizar ubicación"]);
    }
    exit();
}

// LISTAR TODAS LAS UBICACIONES (Por defecto)
$sqlUbicaciones = mysqli_query($conexionBD,"SELECT * FROM ubicaciones ORDER BY nombre ASC");
if(mysqli_num_rows($sqlUbicaciones) > 0){
    $ubicaciones = mysqli_fetch_all($sqlUbicaciones, MYSQLI_ASSOC);
    echo json_encode($ubicaciones);
} else { 
    echo json_encode([]); // Array vacío si no hay ubicaciones
}

// Cerrar conexión
$conexionBD->close();
?>