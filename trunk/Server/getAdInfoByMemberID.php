<?php

$user_input = empty($_POST)?$_GET:$_POST;
$table = 'Advertisement';
$memberID = $user_input['memberID'];
$page = $user_input['page'];
$limit = $user_input['limit'];
//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$start = ($page - 1) * $limit;
$sql = "select * from Advertisement a join Member m on a.MemberID = m.MemberID where a.memberID=".$memberID." limit $start,$limit";


$result = mysql_query($sql);
$rst = array(
        AdID=> '',
        Title=> '',
        Content=> '',
        AdType=> '',
        PostDate=> '',
        UpdateDate=> '',
        ServiceRegion=> '',
        Address=> '',
        Longitude=> '',
        Latitude=> '',
        AccountName=> '',
        Email=> '',
        Phone=> '',
        Role=> '',
);

//output all query
$arr_items = array();
$i = 0;
while ($row = mysql_fetch_array($result)) {
  $i++;
  $rst['AdID'] = $row['AdID'];
  $rst['Title'] = $row['Title'];
  $rst['Content'] = $row['Content'];
  $rst['AdType'] = $row['AdType'];
  $rst['PostDate'] = $row['PostDate'];
  $rst['UpdateDate'] = $row['UpdateDate'];
  $rst['ServiceRegion'] = $row['ServiceRegion'];
  $rst['Address'] = $row['Address'];
  $rst['Longitude'] = $row['Longitude'];
  $rst['Latitude'] = $row['Latitude'];
  $rst['AccountName'] = $row['AccountName'];
  $rst['Email'] = $row['Email'];
  $rst['Phone'] = $row['Phone'];
  $rst['Role'] = $row['Role'];
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
