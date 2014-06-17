<?php

$user_input = empty($_POST)?$_GET:$_POST;
$table = 'Item';
$restId = $user_input['restid'];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "select * from Item where restid=".$restId;
echo $sql;
$start = ($page - 1) * $limit;
$result = mysql_query($sql);
$rst = array(
        ItemID=> '',
        ResID => '',
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
  $rst['ResID'] = $row['ResID'];
  $rst['ItemName'] = $row['CateImg'];
    $rst['ItemImage'] = $row['ItemImage'];
  $rst['ItemPrice'] = $row['ItemPrice'];
  $rst['ItemType'] = $row['ItemType'];
 array_push($arr_items, $rst);
}

$arr_all = array(
  'result' => "succ",
  'data' => $arr_items,
);

$output = json_encode($arr_all);

print_r($output);

?>