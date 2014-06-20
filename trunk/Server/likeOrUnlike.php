<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$memberID = $user_input['memberID'];
$threadID = $user_input['threadID'];
$accountName = $user_input['accountName'];
$like = $user_input['like'];


//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

if($like==1)
{
$sql = "INSERT INTO LikeList
(memberID,threadID,accountName)
VALUES ('$memberID', '$threadID', '$accountName');";
}
else if($like==0)
{
$sql = "delete from LikeList where memberID='$memberID' and threadID='$threadID'";
}

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