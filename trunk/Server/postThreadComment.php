<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$parentID = $user_input['parentID'];
$threadTitle = $user_input['threadTitle'];
$threadContent = $user_input['threadContent'];
$threadImages = $user_input['threadImages'];
$memberID = $user_input['memberID'];
$postDate = date('Y-m-d H:i:s');

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "INSERT INTO Thread
(parentID,threadTitle,threadContent,threadImages,threadType,memberID,threadPostDate)
VALUES ('$parentID', '$threadTitle', '$threadContent', '$threadImages', '$threadType', '$memberID', '$postDate');";
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
