<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$articleID = $user_input['articleID'];
$schema = (@$_SERVER["HTTPS"] == "on") ? "https://" : "http://";
$url = $schema.$_SERVER["SERVER_NAME"];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "select * from Article where ArticleID=".$articleID;

$start = ($page - 1) * $limit;
$result = mysql_query($sql);
$rst = array(
        ArticleTitle=> '',
        ArticleContent=> '',
        ArticleLargeImage=> '',
        ArticleSmallImage=> '',
        imagePosition=> '',
		ArticleDate=> '',
		Author=> '',
		ArticleIssue=> '',
        DisplayStyle=> '',
);

//output all query
$arr_items = array();
$i = 0;
while ($row = mysql_fetch_array($result)) {
  $i++;
  $rst['ArticleTitle'] = $row['ArticleTitle'];
  $rst['ArticleContent'] = $row['ArticleContent'];
  $rst['ArticleLargeImage'] = $url.$row['ArticleLargeImage'];
  $rst['ArticleSmallImage'] = $url.$row['ArticleSmallImage'];
  $rst['imagePosition'] = $row['imagePosition'];
  $rst['ArticleDate'] = $row['ArticleDate'];
  $rst['Author'] = $row['Author'];
  $rst['ArticleIssue'] = $row['ArticleIssue'];
  $rst['DisplayStyle'] = $row['DisplayStyle'];
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
