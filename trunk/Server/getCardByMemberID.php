<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$memberID = $user_input['memberID'];
$schema = (@$_SERVER["HTTPS"] == "on") ? "https://" : "http://";
$url = $schema.$_SERVER["SERVER_NAME"];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$start = ($page - 1) * $limit;
$sql = "select * from Card where memberID=".$memberID;

$result = mysql_query($sql);
$rst = array(
		CardID=> '',
        CardType=> '',
        CardTitle=> '',
        CardBarcode=> '',
        CardNumber=> '',
        CardDes=> '',
		FrontViewImage=> '',
		BackViewImage=> '',
);

//output all query
$arr_items = array();
$i = 0;
while ($row = mysql_fetch_array($result)) {
  $i++;
  $rst['CardID'] = $row['CardID'];
  $rst['CardType'] = $row['CardType'];
  $rst['CardTitle'] = $row['CardTitle'];
  $rst['CardBarcode'] = $row['CardBarcode'];
  $rst['CardNumber'] = $row['CardNumber'];
  $rst['CardDes'] = $row['CardDes'];
  $rst['FrontViewImage'] = $url.$row['FrontViewImage'];
  $rst['BackViewImage'] = $url.$row['BackViewImage'];
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
