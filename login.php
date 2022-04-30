<?php
require_once("connection.php");
require_once("validation.php");
    $validationStatus=validation(
        ['username','password'],$_POST);
    if(count($validationStatus)){
        $return= [
            "status"=>0,
            "data"=>"",
            "message"=>implode(',',$validationStatus)." Required"
        ];
        return print_r(json_encode($return));    
    }
    $username=$_POST['username'];
    $password=md5($_POST['password']);

    $query="select * from users where username='$username' and password='$password'";
    $stmt = $conn->query($query);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    if(!isset($result['username'])){
        $return= [
            "status"=>0,
            "data"=>"",
            "message"=>"Invalid credentials"
        ];
        return print_r(json_encode($return));
    }
    unset($result['password']);
    $return= [
        "status"=>1,
        "data"=>$result,
        "message"=>"user details"
    ];
    return print_r(json_encode($return));


?>