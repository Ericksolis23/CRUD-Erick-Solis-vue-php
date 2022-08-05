<?php
include_once 'conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$_POST = json_decode(file_get_contents("php://input"), true);

function permisos() {  
  if (isset($_SERVER['HTTP_ORIGIN'])){
      header("Access-Control-Allow-Origin: *");
      header("Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS");
      header("Access-Control-Allow-Headers: Origin, Authorization, X-Requested-With, Content-Type, Accept");
      header('Access-Control-Allow-Credentials: true');      
  }  
  if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS'){
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))          
        header("Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS");
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
        header("Access-Control-Allow-Headers: Origin, Authorization, X-Requested-With, Content-Type, Accept");
    exit(0);
  }
}
permisos();


$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
$id_pastel = (isset($_POST['id_pastel'])) ? $_POST['id_pastel'] : '';
$Nombre = (isset($_POST['Nombre'])) ? $_POST['Nombre'] : '';
$Descripcion = (isset($_POST['Descripcion'])) ? $_POST['Descripcion'] : '';
$Preparado_por = (isset($_POST['Preparado_por'])) ? $_POST['Preparado_por'] : '';
$Fecha_creacion = (isset($_POST['Fecha_creacion'])) ? $_POST['Fecha_creacion'] : '';
$Fecha_vencimiento = (isset($_POST['Fecha_vencimiento'])) ? $_POST['Fecha_vencimiento'] : '';


switch($opcion){
	case 1:
        $consulta = "SELECT id_pastel, Nombre, Descripcion, Preparado_por, Fecha_creacion, Fecha_vencimiento FROM pastel";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
    case 2:
        $consulta = "INSERT INTO pastel (Nombre, Descripcion, Preparado_por, Fecha_creacion, Fecha_vencimiento) VALUES('$Nombre','$Descripcion', '$Preparado_por', '$Fecha_creacion', '$Fecha_vencimiento') ";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                
        break;
    case 3:
        $consulta = "UPDATE pastel SET Nombre='$Nombre', Descripcion='$Descripcion', Preparado_por='$Preparado_por', Fecha_creacion='$Fecha_creacion', Fecha_vencimiento='$Fecha_vencimiento' WHERE Nombre='$Nombre' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                        
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;        
    case 4:
        $consulta = "DELETE FROM pastel WHERE Nombre='$Nombre' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                           
        break;         
    
}
print json_encode($data, JSON_UNESCAPED_UNICODE);
$conexion = NULL;