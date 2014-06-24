<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$memberID = $user_input['memberID'];

$image = "image/member/";
$FileID=date("Ymd-His") . '-' . rand(100,999);
$image = $image . $FileID. $_FILES['uploaded']['name'];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

if(move_uploaded_file($_FILES['uploaded']['tmp_name'], $image))
{
$sql = "update Member set Image = '$image' where MemberID = '$memberID'";

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
  'result' => $result,
);
}
}
else {
  $arr_all = array(
  'result' => "upload image fail",
  );
}
}


$output = json_encode($arr_all);

print_r($output);

?>
