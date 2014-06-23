<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$cardID = $user_input['cardID'];
$cardTitle = $user_input['cardTitle'];
$cardBarcode = $user_input['cardBarcode'];
$cardNumber = $user_input['cardNumber'];
$cardDes = $user_input['cardDes'];


$image = "image/";
$FileID1=date("Ymd-His") . '-' . rand(100,999);
$FileID2=date("Ymd-His") . '-' . rand(100,999);
$frontViewImage = $image . $FileID1. $_FILES['uploaded1']['name'];
$backViewImage = $image . $FileID2. $_FILES['uploaded2']['name'];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql1 = "select frontViewImage, backViewImage from Card where cardID = '$cardID'";
$result1 = mysql_query($sql1);
while ($row = mysql_fetch_array($result1))
{
	$oldFrontViewImage = $row['FrontViewImage'];
	$oldBackViewImage = $row['BackViewImage'];
	unlink($oldFrontViewImage);
	unlink($oldBackViewImage);
}
if(!$result1)
{
	$arr_all = array(
	  'result' => "delete old image fail",
);
}
else
{

if(move_uploaded_file($_FILES['uploaded1']['tmp_name'], $frontViewImage)&&move_uploaded_file($_FILES['uploaded2']['tmp_name'], $backViewImage))
{
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
}
else {
  $arr_all = array(
  'result' => "fail",
  );
}
}

$output = json_encode($arr_all);

print_r($output);

?>
