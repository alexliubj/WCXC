<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
//$adType = 'Restaurant';
$page = $user_input['page'];
$limit = $user_input['limit'];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$start = ($page - 1) * $limit;

$sql = "SELECT * FROM Thread WHERE ParentID=0 limit $start,$limit";


$result = mysql_query($sql);
$rst = array(
        ThreadID=> '',
        ThreadTitle=> '',
        ThreadPostDate=> '',
        ThreadUpdateDate=> '',
        ThreadContent=> '',
        ThreadImages=> '',
        ThreadType=> '',
        MemberID=> '',
        LastCommentDate=> '',
);

//output all query
$arr_items = array();
$i = 0;
while ($row = mysql_fetch_array($result)) {
  $i++;
  $rst['ThreadID'] = $row['ThreadID'];
  $rst['ThreadTitle'] = $row['ThreadTitle'];
  $rst['ThreadPostDate'] = $row['ThreadPostDate'];
  $rst['ThreadUpdateDate'] = $row['ThreadUpdateDate'];
  $rst['ThreadContent'] = $row['ThreadContent'];
  $rst['ThreadImages'] = $row['ThreadImages'];
  $rst['ThreadType'] = $row['ThreadType'];
  $rst['MemberID'] = $row['MemberID'];
  $rst['LastCommentDate'] = $row['LastCommentDate'];
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

