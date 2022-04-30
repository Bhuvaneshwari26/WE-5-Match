<?php
require_once("../connection.php");
require_once("../validation.php");
$emp_id=$_POST['emp_id'];
$query="select * from employees e inner join users u on e.emp_id=u.user_id where emp_id='$emp_id'";
$stmt = $conn->query($query);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

$return= [
    "status"=>1,
    "data"=>$result,
    "message"=>"Employee"
];
return print_r(json_encode($return));

?>