<?php

$user_input = empty($_POST)?$_GET:$_POST;
$memberID = $user_input['memberID'];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "select * from Member where memberID=".$memberID;
echo $sql;
$start = ($page - 1) * $limit;
$result = mysql_query($sql);
$rst = array(
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

if($result)
{
$arr_all = array(
  'result' => "succ",
  'data' => $arr_items,
);
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


