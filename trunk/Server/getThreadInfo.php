<?php

$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
$threadID = $user_input['threadID'];
$schema = (@$_SERVER["HTTPS"] == "on") ? "https://" : "http://";
$url = $schema.$_SERVER["SERVER_NAME"];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$sql = "select * from Thread t join Member m on t.MemberID = m.MemberID where ThreadID=".$threadID." and ParentID=0";

$start = ($page - 1) * $limit;
$result = mysql_query($sql);
$rst = array(
        ThreadTitle=> '',
        ThreadPostDate=> '',
        ThreadUpdateDate=> '',
        ThreadContent=> '',
        ThreadImages=> '',
		ThreadType=> '',
		MemberID=> '',
		AccountName=> '',
);

//output all query
$arr_items = array();
$i = 0;

while ($row = mysql_fetch_array($result)) {
  $i++;
   $sql1 = "SELECT * FROM ThreadImage WHERE ThreadID=".$row['ThreadID'];
    $result1 = mysql_query($sql1);
	$rst1 = array(
        ImageID=> '',
        ImageUrl=> '',
);
	$arr_image = array();
	$m=0;
	while ($row1 = mysql_fetch_array($result1)) {
		$m++;
	  $rst1['ImageID'] = $row1['ImageID'];
	  $rst1['ImageUrl'] = $url.$row1['ImageUrl'];
	 array_push($arr_image, $rst1);
	}
	
  $rst['ThreadTitle'] = $row['ThreadTitle'];
  $rst['ThreadPostDate'] = $row['ThreadPostDate'];
  $rst['ThreadUpdateDate'] = $row['ThreadUpdateDate'];
  $rst['ThreadContent'] = $row['ThreadContent'];
  $rst['ThreadType'] = $row['ThreadType'];
  $rst['MemberID'] = $row['MemberID'];
  $rst['AccountName'] = $row['AccountName'];
  $rst['ThreadImages'] = $arr_image;
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
