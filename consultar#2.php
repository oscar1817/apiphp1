<?php 

//header("Content-Type: application/json"); //respuesta en JSON 

//header("Access-Control-Allow-Origin: *"); //Todos los origenes 

//header("Access-Control-Allow-Methods: DELETE, PUT, POST, GET");  //metodos aceptados 

//header("Access-Control-Allow-Headers: Origin,X-Requested-With, Content-Type, Accept"); 

//Metodos de respuesta  DELETE(Eliminar), PUT(Actualizar), POST(Consulta), GET(Insertar) 

require "conexion.php"; 


$sql="SELECT * FROM `p_siga` WHERE 1";
 
$respuesta=mysqli_query($con,$sql); //relizar Query 

if(!$respuesta){die("Error de consulta y/o conexion");} 

$resJson=array(); //dereclarcion de vector 

while($r=$respuesta->fetch_assoc()){ 

array_push($resJson,$r); // adicion de cada registro al vector 

} 

mysqli_close($con); //Cerrar la Conxion 

echo json_encode($resJson); //conversion a JSON 

?>