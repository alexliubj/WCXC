<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$adType = $user_input['adType'];
$title = $user_input['title'];
$content = $user_input['content'];
$serviceRegion = $user_input['serviceRegion'];
$address = $user_input['address'];
$longitude = $user_input['longitude'];
$latitude = $user_input['latitude'];
$memberID = $user_input['memberID'];
$image = $user_input['image'];
$postDate = date('Y-m-d H:i:s');


//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "INSERT INTO Advertisement
(adType,title,content,serviceRegion,address,longitude,latitude,memberID,image,postDate)
VALUES ('$adType', '$title', '$content', '$serviceRegion', '$address', '$longitude', '$latitude', '$memberID', '$image', '$postDate');";
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
