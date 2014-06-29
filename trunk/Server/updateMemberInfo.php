<?php

$user_input = empty($_POST)?$_GET:$_POST;

$memberID = $user_input['memberID'];
$firstName = $user_input['firstName'];
$lastName = $user_input['lastName'];
$school = $user_input['school'];
$major = $user_input['major'];
$address = $user_input['address'];
$city = $user_input['city'];
$province = $user_input['province'];
$postalCode = $user_input['postalCode'];
$accountName = $user_input['accountName'];
$password = $user_input['password'];
$email = $user_input['email'];
$phone = $user_input['phone'];

$password = $user_input['password'];
$password_hash = md5($password);

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "update Member set FirstName = '$firstName', LastName = '$lastName', school = '$school', major = '$major', street = '$address',
city = '$city', province = '$province', postalCode = '$postalCode', accountName = '$accountName', password = '$password_hash', email = '$email', phone = '$phone' where MemberID = '$memberID'";

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
