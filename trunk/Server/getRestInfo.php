<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
//$adType = 'Restaurant';
$schema = (@$_SERVER["HTTPS"] == "on") ? "https://" : "http://";
$url = $schema.$_SERVER["SERVER_NAME"];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "select * from Advertisement where adType=0";

$start = ($page - 1) * $limit;
$result = mysql_query($sql);
$rst = array(
        AdID=> '',
        Title=> '',
        Content=> '',
        MemberID=> '',
        ServiceRegion=> '',
        Address=> '',
        Longitude=> '',
        Latitude=> '',
        DeliverPrice=> '',
        Image=> '',
);

//output all query
$arr_items = array();
$i = 0;
while ($row = mysql_fetch_array($result)) {
  $i++;
  $rst['AdID'] = $row['AdID'];
  $rst['Title'] = $row['Title'];
  $rst['Content'] = $row['Content'];
  $rst['MemberID'] = $row['MemberID'];
  $rst['ServiceRegion'] = $row['ServiceRegion'];
  $rst['Address'] = $row['Address'];
  $rst['Longitude'] = $row['Longitude'];
  $rst['Latitude'] = $row['Latitude'];
  $rst['DeliverPrice'] = $row['DeliverPrice'];
  $rst['Image'] = $url.$row['Image'];
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

