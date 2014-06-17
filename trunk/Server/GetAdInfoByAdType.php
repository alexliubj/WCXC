<?php

$user_input = empty($_POST)?$_GET:$_POST;
$table = 'Advertisement';
$adType = $user_input['adType'];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "select * from Advertisement a join Member m on a.MemberID = m.MemberID where adType=".$adType;

$start = ($page - 1) * $limit;
$result = mysql_query($sql);
$rst = array(
        AdID=> '',
        Title=> '',
        Content=> '',
        MemberID=> '',
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
  $rst['MemberID'] = $row['MemberID'];
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

$arr_all = array(
  'result' => "succ",
  'data' => $arr_items,
);

$output = json_encode($arr_all);

print_r($output);

?>
