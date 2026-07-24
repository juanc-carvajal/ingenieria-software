<?php
/* 
API específica para RESPONSABLES
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

// -------------------------- RESPONSABLES ------------------

// Consultar por ID
if (isset($_GET["consultar"])) {
    $id = intval($_GET["consultar"]);
    $sqlResponsable = mysqli_query($conexionBD,"SELECT * FROM responsables WHERE id=$id");
    if (mysqli_num_rows($sqlResponsable) > 0) {
        $responsable = mysqli_fetch_all($sqlResponsable, MYSQLI_ASSOC);
        echo json_encode($responsable); 
        exit();
    } else { 
        echo json_encode(["success" => 0, "message" => "Responsable no encontrado"]); 
        exit();
    }
}

// Consultar por código
if (isset($_GET["consultarCod"])) {
    $codigo = mysqli_real_escape_string($conexionBD, $_GET["consultarCod"]);
    $sqlResponsable = mysqli_query($conexionBD, "SELECT * FROM responsables WHERE codigo='$codigo'");
    if (mysqli_num_rows($sqlResponsable) > 0) {
        $responsable = mysqli_fetch_assoc($sqlResponsable);
        echo json_encode($responsable);
        exit();
    } else { 
        echo json_encode(["success" => 0, "message" => "Responsable no encontrado"]); 
        exit();
    }
}

// Consultar por documento
if (isset($_GET["consultarDoc"])) {
    $documento = mysqli_real_escape_string($conexionBD, $_GET["consultarDoc"]);
    $sqlResponsable = mysqli_query($conexionBD, "SELECT * FROM responsables WHERE documento='$documento'");
    if (mysqli_num_rows($sqlResponsable) > 0) {
        $responsable = mysqli_fetch_assoc($sqlResponsable);
        echo json_encode($responsable);
        exit();
    } else { 
        echo json_encode(["success" => 0, "message" => "Responsable no encontrado"]); 
        exit();
    }
}

// Borrar por ID
if (isset($_GET["borrar"])) {
    $id = intval($_GET["borrar"]);
    $sqlResponsable = mysqli_query($conexionBD,"DELETE FROM responsables WHERE id=$id");
    if ($sqlResponsable) {
        echo json_encode(["success" => 1, "message" => "Responsable eliminado correctamente"]);
    } else {
        echo json_encode(["success" => 0, "message" => "Error al eliminar responsable"]);
    }
    exit();
}

// Insertar nuevo responsable
if (isset($_GET["insertar"])) {
    $data = json_decode(file_get_contents("php://input"));
    
    if (!$data) {
        echo json_encode(["success" => 0, "message" => "Datos no válidos"]);
        exit();
    }
    
    $codigo = mysqli_real_escape_string($conexionBD, $data->codigo);
    $documento = mysqli_real_escape_string($conexionBD, $data->documento);
    $nombre = mysqli_real_escape_string($conexionBD, $data->nombre);
    $apellido = mysqli_real_escape_string($conexionBD, $data->apellido);
    $cargo = mysqli_real_escape_string($conexionBD, $data->cargo);
    $telefono = mysqli_real_escape_string($conexionBD, $data->telefono);
    
    if(($codigo != "") && ($documento != "") && ($nombre != "") && ($apellido != "") && ($cargo != "") && ($telefono != "")) {        
        $sqlResponsable = mysqli_query($conexionBD,"INSERT INTO responsables(codigo, documento, nombre, apellido, cargo, telefono) VALUES('$codigo','$documento','$nombre','$apellido','$cargo','$telefono')");
        if ($sqlResponsable) {
            echo json_encode(["success" => 1, "message" => "Responsable creado correctamente"]);
        } else {
            echo json_encode(["success" => 0, "message" => "Error al crear responsable"]);
        }
    } else {
        echo json_encode(["success" => 0, "message" => "Todos los campos son obligatorios"]);
    }
    exit();
}

// Actualizar responsable existente
if (isset($_GET["actualizar"])) { 
    $data = json_decode(file_get_contents("php://input"));
    
    if (!$data) {
        echo json_encode(["success" => 0, "message" => "Datos no válidos"]);
        exit();
    }
    
    $id = (isset($data->id)) ? intval($data->id) : intval($_GET["actualizar"]);
    $codigo = mysqli_real_escape_string($conexionBD, $data->codigo);
    $documento = mysqli_real_escape_string($conexionBD, $data->documento);
    $nombre = mysqli_real_escape_string($conexionBD, $data->nombre);
    $apellido = mysqli_real_escape_string($conexionBD, $data->apellido);
    $cargo = mysqli_real_escape_string($conexionBD, $data->cargo);
    $telefono = mysqli_real_escape_string($conexionBD, $data->telefono);
    
    $sqlResponsable = mysqli_query($conexionBD,"UPDATE responsables SET codigo='$codigo', documento='$documento', nombre='$nombre', apellido='$apellido', cargo='$cargo', telefono='$telefono' WHERE id='$id'");
    if ($sqlResponsable) {
        echo json_encode(["success" => 1, "message" => "Responsable actualizado correctamente"]);
    } else {
        echo json_encode(["success" => 0, "message" => "Error al actualizar responsable"]);
    }
    exit();
}

// LISTAR TODOS LOS RESPONSABLES (Por defecto)
$sqlResponsables = mysqli_query($conexionBD,"SELECT * FROM responsables ORDER BY apellido ASC, nombre ASC");
if(mysqli_num_rows($sqlResponsables) > 0){
    $responsables = mysqli_fetch_all($sqlResponsables, MYSQLI_ASSOC);
    echo json_encode($responsables);
} else { 
    echo json_encode([]); // Array vacío si no hay responsables
}

// Cerrar conexión
$conexionBD->close();
?>