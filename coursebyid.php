<?php
require_once("../connection.php");
require_once("../validation.php");
$course_id=$_POST['course_id'];
$query="select * from course where course_id='$course_id'";
$stmt = $conn->query($query);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

$return= [
    "status"=>1,
    "data"=>$result,
    "message"=>"Course"
];
return print_r(json_encode($return));

?>