<?php

$user_input = empty($_POST)?$_GET:$_POST;
$email = $user_input['email'];
$phone = $user_input['phone'];

$password = $user_input['password'];
$salt = openssl_random_pseudo_bytes(22);
$salt = '$2a$%13$' . strtr($salt, array('_' => '.', '~' => '/'));
$password_hash = crypt($password, $salt);

$lastLoginDate = date('Y-m-d H:i:s');

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

if($email != null)
{
$sql = "select * from Member where email='$email' and password='$password_hash';";
}
else if($phone != null)
{
$sql = "select * from Member where phone='$phone' and password='$password_hash';";
}

$start = ($page - 1) * $limit;
$result = mysql_query($sql);
$rst = array(
		memberID=>'',
        firstName=> '',
        lastName=> '',
        school=> '',
        major=> '',
        houseNo=> '',
		street=> '',
		city=> '',
		province=> '',
		postalCode=> '',
        image=> '',
		accountName=> '',
		password=> '',
		status=> '',
		email=> '',
        phone=> '',
		role=> '',
);

//output all query
$arr_items = array();
$i = 0;
while ($row = mysql_fetch_array($result)) {
  $i++;
  $rst['memberID'] = $row['MemberID'];
  $rst['firstName'] = $row['FirstName'];
  $rst['lastName'] = $row['LastName'];
  $rst['school'] = $row['School'];
  $rst['houseNo'] = $row['HouseNo'];
  $rst['street'] = $row['Street'];
  $rst['city'] = $row['City'];
  $rst['province'] = $row['Province'];
  $rst['postalCode'] = $row['PostalCode'];
  $rst['image'] = $row['Image'];
  $rst['accountName'] = $row['AccountName'];
  $rst['password'] = $row['Password'];
  $rst['status'] = $row['Status'];
  $rst['email'] = $row['Email'];
  $rst['phone'] = $row['Phone'];
  $rst['role'] = $row['Role'];
 array_push($arr_items, $rst);
}

$memberID = $rst['memberID'];

if($result)
{
$sql1 = "update Member set lastLoginDate = '$lastLoginDate' where MemberID = '$memberID'";
$result1 = mysql_query($sql1);
if($result1)
{
$arr_all = array(
  'result' => "succ",
  'data' => $arr_items,
  );
}
else
{
$arr_all = array(
  'result' => "update LoginDate fail",
  'data' => $arr_items,
  );
}

}
else
{
$arr_all = array(
  'result' => "fail",
  'data' => $arr_items,
);
}

$output = json_encode($arr_all);

print_r($output);

?>


