<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$threadTitle = $user_input['threadTitle'];
$threadContent = $user_input['threadContent'];
//$threadImages = $user_input['threadImages'];
$threadType = $user_input['threadType'];
$memberID = $user_input['memberID'];
$postDate = date('Y-m-d H:i:s');

$image = "image/thread/";
for($i = 1; $i <=9; $i++)
{
	if(is_uploaded_file($_FILES['uploaded'.$i]['tmp_name'])
	{
		$FileID=date("Ymd-His") . '-' . rand(100,999);
		$threadImages[$i] = $image . $FileID. $_FILES['uploaded'.$i]['name'];
	}
}

//connect to database
/* mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error()); */

//select a database
// mysql_select_db("WeChao"); 

$mysqli = new mysqli("localhost", "root", "wechao", "WeChao");

if (mysqli_connect_errno()) {
printf("Connect failed: %s\n", mysqli_connect_error());
exit();
}

$mysqli->autocommit(FALSE);

$mysqli->query("INSERT INTO Thread
(threadTitle,threadContent,threadImages,threadType,memberID,threadPostDate)
VALUES ('$threadTitle', '$threadContent', '$threadImages', '$threadType', '$memberID', '$postDate');");

$mysqli->commit();

$threadID = $mysqli->insert_id;

for($i = 1; $i <=9; $i++)
{
	if(is_uploaded_file($_FILES['uploaded'.$i]['tmp_name'])
	{
		if(move_uploaded_file($_FILES['uploaded'.$i]['tmp_name'], $threadImages[$i]))
		{
			$sql = "INSERT INTO ThreadImage
			(ThreadID, ImageUrl)
			VALUES ('$threadID', '$threadImages[$i]');";

			$mysqli->query(sql);
		}
	}
}

$result = $mysqli->rollback();

$mysqli->close(); 

if($result)
{
$arr_all = array(
  'result' => $result . "succ?",
);
}
else
{
$arr_all = array(
  'result' => $result . "fail?",
);
}

$output = json_encode($arr_all);
print_r($output);

?>
