<?php
require_once("../connection.php");
require_once("../validation.php");
if(isset($_POST['name'])){

    //Required Validation
    $validationStatus=validation(
        ['name','email','username','gender','password','address','phone'],$_POST);
    if(count($validationStatus)){
        $return= [
            "status"=>0,
            "data"=>"",
            "message"=>implode(',',$validationStatus)." Required"
        ];
        return print_r(json_encode($return));    
    }


    //Username validation or email id validation
    $email=$_POST['email'];
    $query="select * from employees where email='$email'";
    $stmt = $conn->query($query);
    $result = $stmt->rowCount();

    if($result>0){
        $return= [
            "status"=>0,
            "data"=>"",
            "message"=>"Email id already exist"
        ];
        return print_r(json_encode($return));    
        // return print_r($return);    
    }

    $username=$_POST['username'];
    $query="select * from users where username='$username'";
    $stmt = $conn->query($query);
    $result = $stmt->rowCount();

    if($result>0){
        $return= [
            "status"=>0,
            "data"=>"",
            "message"=>"Username already exist"
        ];
        return print_r(json_encode($return));    
        // return print_r($return);    
    }

    $empCount="select * from employees order by emp_id DESC limit 1";
    $stmt = $conn->query($empCount);
    $result = $stmt->fetch(); 
    
    $emp_id="EMP00";
    if(!isset($result['emp_id'])){
        $emp_id.=1;
    }else{
        $emp_id.=filter_var($result['emp_id'],FILTER_SANITIZE_NUMBER_INT)+1;
    }

    //Employee create
    $sql = "INSERT INTO employees (emp_id, name, role,email,phone,address,gender) VALUES (?,?,?,?,?,?,?)";
    $conn->prepare($sql)->execute([$emp_id,$_POST['name'],$_POST['role'],$_POST['email'],$_POST['phone'],$_POST['address'],$_POST['gender']]);
    
    //Login create
    $sql1 = "INSERT INTO users (username,password,user_id,role) VALUES (?,?,?,?)";
    $conn->prepare($sql1)->execute([$_POST['username'],md5($_POST['password']),$emp_id,'employee']);
    

    $return= [
        "status"=>1,
        "data"=>"",
        "message"=>"Added Successfully"
    ];
        return print_r(json_encode($return));    
    // return print_r($return);
}
$return= [
    "status"=>0,
    "data"=>"",
    "message"=>"Method not allowed"
];
        return print_r(json_encode($return));    
//return print_r($return);
?>
