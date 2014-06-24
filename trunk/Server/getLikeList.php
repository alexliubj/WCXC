<?php

$user_input = empty($_POST)?$_GET:$_POST;
$threadID = $user_input['threadID'];
$page = $user_input['page'];
$limit = $user_input['limit'];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$start = ($page - 1) * $limit;
$sql = "select * from LikeList where threadID=".$threadID." limit $start,$limit";

$result = mysql_query($sql);
$rst = array(
        memberID=> '',
        accountName=> '',
);

//output all query
$arr_items = array();
$i = 0;
while ($row = mysql_fetch_array($result)) {
  $i++;
  $rst['memberID'] = $row['MemberID'];
  $rst['accountName'] = $row['AccountName'];
 array_push($arr_items, $rst);
}

if($result)
{
$arr_all = array(
  'result' => "succ",
  'data' => $arr_items,
);
}
else
{
$arr_all = array(
  'result' => "fail",
  'data' => $arr_items,
);
}

$output = json_encode($arr_all);

print_r($output);

?>


