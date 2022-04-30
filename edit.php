<?php
require_once("../connection.php");
require_once("../validation.php");
if(isset($_POST['name'])){
    $validationStatus=validation(
        ['name','role','phone','address','gender','emp_id'],$_POST);
    if(count($validationStatus)){
        $return= [
            "status"=>0,
            "data"=>"",
            "message"=>implode(',',$validationStatus)." Required"
        ];
        return print_r(json_encode($return));    
    }

    $sql = "UPDATE employees set name=?,role=?,phone=?,address=?,gender=? where emp_id=?";
    $conn->prepare($sql)->execute([$_POST['name'],$_POST['role'],$_POST['phone'],$_POST['address'],$_POST['gender'],$_POST['emp_id']]);

    if(isset($_POST['password']) && $_POST['password']){
        $sql = "UPDATE users set password=? where user_id=?";
        $conn->prepare($sql)->execute([$_POST['password'],$_POST['emp_id']]);
    }

    $return= [
        "status"=>1,
        "data"=>"",
        "message"=>"Updated successfully"
    ];
    return print_r(json_encode($return)); 

}
?>