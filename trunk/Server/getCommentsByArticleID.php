<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$articleID = $user_input['articleID'];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "select * from AtcComment a join Member m on a.MemberID = m.MemberID where ArticleID=".$articleID;

$start = ($page - 1) * $limit;
$result = mysql_query($sql);
$rst = array(
        CommentID=> '',
        CommentContent=> '',
        MemberID=> '',
        PostDate=> '',
        UpdateDate=> '',
        AccountName=>'',
);

//output all query
$arr_items = array();
$i = 0;
while ($row = mysql_fetch_array($result)) {
  $i++;
  $rst['CommentID'] = $row['CommentID'];
  $rst['CommentContent'] = $row['CommentContent'];
  $rst['MemberID'] = $row['MemberID'];
  $rst['PostDate'] = $row['PostDate'];
  $rst['UpdateDate'] = $row['UpdateDate'];
  $rst['AccountName'] = $row['AccountName'];
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
