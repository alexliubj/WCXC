<?php

$user_input = empty($_POST)?$_GET:$_POST;
$table = 'Item';
$restId = $user_input['restid'];
$schema = (@$_SERVER["HTTPS"] == "on") ? "https://" : "http://";
$url = $schema.$_SERVER["SERVER_NAME"];
$page = $user_input['page'];
$limit = $user_input['limit'];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$start = ($page - 1) * $limit;
$sql = "select * from item where restid=".$restId." limit $start,$limit";

$result = mysql_query($sql);
$rst = array(
        ItemID=> '',
        ItemName=> '',
        ItemImage=> '',
        ItemPrice=> '',
        ItemType=> '',
);

//output all query
$arr_items = array();
$i = 0;
while ($row = mysql_fetch_array($result)) {
  $i++;
  $rst['ItemID'] = $row['ItemID'];
  $rst['ItemName'] = $row['ItemName'];
  $rst['ItemImage'] = $url.$row['ItemImage'];
  $rst['ItemPrice'] = $row['ItemPrice'];
  $rst['ItemType'] = $row['ItemType'];
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
