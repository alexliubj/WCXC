<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$threadTitle = $user_input['threadTitle'];
$threadContent = $user_input['threadContent'];
//$threadImages = $user_input['threadImages'];
$threadType = $user_input['threadType'];
$memberID = $user_input['memberID'];
$postDate = date('Y-m-d H:i:s');

$image = "image/";
for($i = 1; $i <=9; $i++)
{
if(is_uploaded_file($_FILES['uploaded'.$i]['tmp_name'])
{
$FileID=date("Ymd-His") . '-' . rand(100,999);
$threadImage[$i] = $image . $FileID. $_FILES['uploaded'.$i]['name'];
}
}


//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

if(move_uploaded_file($_FILES['uploaded']['tmp_name'], $threadImages))
{
$sql = "INSERT INTO Thread
(threadTitle,threadContent,threadImages,threadType,memberID,threadPostDate)
VALUES ('$threadTitle', '$threadContent', '$threadImages', '$threadType', '$memberID', '$postDate');";
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
}
else {
  $arr_all = array(
  'result' => "fail",
  );
}

$output = json_encode($arr_all);
print_r($output);

?>
