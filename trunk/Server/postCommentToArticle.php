<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$articleID = $user_input['articleID'];
$memberID = $user_input['memberID'];
$commentContent = $user_input['commentContent'];
$postDate = date('Y-m-d H:i:s');


//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "INSERT INTO AtcComment
(CommentContent,MemberID,ArticleID,PostDate)
VALUES ('$commentContent', '$memberID', '$articleID', '$postDate');";
//$start = ($page - 1) * $limit;

$update = mysql_query($sql);

$arr_all = array(
  'result' => "succ",
);

$output = json_encode($arr_all);

?>
