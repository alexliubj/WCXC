<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$cardID = $user_input['cardID'];
$cardTitle = $user_input['cardTitle'];
$cardBarcode = $user_input['cardBarcode'];
$cardNumber = $user_input['cardNumber'];
$cardDes = $user_input['cardDes'];
$frontViewImage = $user_input['frontViewImage'];
$backViewImage = $user_input['backViewImage'];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "update Card set cardTitle = '$cardTitle', cardBarcode = '$cardBarcode', cardNumber = '$cardNumber',cardDes = '$cardDes',
frontViewImage = '$frontViewImage', backViewImage = '$backViewImage' where cardID = '$cardID'";


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
