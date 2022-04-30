<?php
require_once("../connection.php");
require_once("../validation.php");
$emp_id=$_POST['emp_id'];

$query="DELETE FROM employees WHERE emp_id ='$emp_id'";
$stmt = $conn->prepare($query);
$stmt->execute();

$query="DELETE FROM users WHERE user_id ='$emp_id'";
$stmt = $conn->prepare($query);
$stmt->execute();
   
$return= [
    "status"=>1,
    "data"=>"",
    "message"=>"Deleted successfully"
];
return print_r(json_encode($return));

?>