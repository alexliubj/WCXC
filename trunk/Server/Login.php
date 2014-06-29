<?php
date_default_timezone_set('America/Toronto');
$user_input = empty($_POST)?$_GET:$_POST;
$email = $user_input['email'];
$phone = $user_input['phone'];

$password = $user_input['password'];
$password_hash = md5($password);

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
$num_rows = mysql_num_rows($result);
$rst = array(
		memberID=>'',
        school=> '',
        major=> '',
		address=> '',
		city=> '',
		province=> '',
		postalCode=> '',
        profileImage=> '',
		accountName=> '',
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
  $rst['school'] = $row['School'];
  $rst['major'] = $row['Major'];
  $rst['address'] = $row['Street'];
  $rst['city'] = $row['City'];
  $rst['province'] = $row['Province'];
  $rst['postalCode'] = $row['PostalCode'];
  $rst['profileImage'] = $row['Image'];
  $rst['accountName'] = $row['AccountName'];
  $rst['status'] = $row['Status'];
  $rst['email'] = $row['Email'];
  $rst['phone'] = $row['Phone'];
  $rst['role'] = $row['Role'];
  if($i==1)
  {
 array_push($arr_items, $rst);
  }
}

$memberID = $rst['memberID'];

if($result&&$num_rows>0)
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
  'result' => "Login Fail",
  'data' => $arr_items,
);
}

$output = json_encode($arr_all);

print_r($output);

?>


