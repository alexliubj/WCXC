<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$cardType = $user_input['cardType'];
$cardTitle = $user_input['cardTitle'];
$cardBarcode = $user_input['cardBarcode'];
$cardNumber = $user_input['cardNumber'];
$cardDes = $user_input['cardDes'];
$frontViewImage = $user_input['frontViewImage'];
$backViewImage = $user_input['backViewImage'];
$memberID = $user_input['memberID'];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "INSERT INTO Card
(cardType,cardTitle,cardBarcode,cardNumber,cardDes,frontViewImage,backViewImage,memberID)
VALUES ('$cardType', '$cardTitle', '$cardBarcode', '$cardNumber', '$cardDes', '$frontViewImage', '$backViewImage', '$memberID');";
//$start = ($page - 1) * $limit;

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
