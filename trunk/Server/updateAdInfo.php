<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$adID = $user_input['adID'];
$title = $user_input['title'];
$content = $user_input['content'];
$serviceRegion = $user_input['serviceRegion'];
$address = $user_input['address'];
$longitude = $user_input['longitude'];
$latitude = $user_input['latitude'];
//$image = $user_input['image'];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "update Advertisement set title = '$title', content = '$content', serviceRegion = '$serviceRegion', address = '$address',longitude = '$longitude',
latitude = '$latitude' where adID = '$adID'";


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
