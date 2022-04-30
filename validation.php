<?php
function validation($requiredKey,$postKey){
    $keyRequired=[];
    foreach($requiredKey as $key){
        if(!isset($postKey[$key])){
            array_push($keyRequired,$key);
        }
    }
    return $keyRequired;
}
?>