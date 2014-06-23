<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$memberID = $user_input['memberID'];
$firstName = $user_input['firstName'];
$lastName = $user_input['lastName'];
$school = $user_input['school'];
$major = $user_input['major'];
$houseNo = $user_input['houseNo'];
$street = $user_input['street'];
$city = $user_input['city'];
$province = $user_input['province'];
$postalCode = $user_input['postalCode'];
$accountName = $user_input['accountName'];
$password = $user_input['password'];
$status = $user_input['status'];
$email = $user_input['email'];
$phone = $user_input['phone'];
$role = $user_input['role'];


//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "update Member set FirstName = '$firstName', LastName = '$lastName', school = '$school', major = '$major', houseNo = '$houseNo',street = '$street',
city = '$city', province = '$province', postalCode = '$postalCode', accountName = '$accountName', password = '$password',
status = '$status', email = '$email', phone = '$phone', role = '$role' where MemberID = '$memberID'";


$start = ($page - 1) * $limit;
$result = mysql_query($sql);


if($result)
{
$arr_all = array(
  'result' => "succ",
);
}
else
{
$arr_all = array(
  'result' => "fail",
);
}



$output = json_encode($arr_all);

print_r($output);

?>
