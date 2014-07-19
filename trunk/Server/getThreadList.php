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

$sql = "SELECT * FROM Thread WHERE ParentID=0 order by ThreadPostDate DESC limit $start,$limit";

$result = mysql_query($sql);
$rst = array(
        ThreadID=> '',
        ThreadTitle=> '',
        ThreadPostDate=> '',
        ThreadUpdateDate=> '',
        ThreadContent=> '',
        ThreadType=> '',
        MemberID=> '',
        LastCommentDate=> '',
		ThreadImages=> '',
		LikeList=> '',
		Comments=> '',
);

//output all query
$arr_items = array();

$i = 0;
$schema = (@$_SERVER["HTTPS"] == "on") ? "https://" : "http://";
$url = $schema.$_SERVER["SERVER_NAME"];

while ($row = mysql_fetch_array($result)) {
  $i++;
  //ThtreadImage
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
	//LikeList
    $sql2 = "SELECT * FROM LikeList WHERE ThreadID=".$row['ThreadID'];
    $result2 = mysql_query($sql2);
	$rst2 = array(
        AccountName=> '',
        MemberID=> '',
);
	$arr_likeList = array();
	$n=0;
	while ($row2 = mysql_fetch_array($result2)) {
		$n++;
	  $rst2['AccountName'] = $row2['AccountName'];
	  $rst2['MemberID'] = $row2['MemberID'];
	 array_push($arr_likeList, $rst2);
	}
	//Comments
	$limit = 5;
	$sql3 = "select * from Thread t join Member m on t.MemberID = m.MemberID where ParentID=".$row['ThreadID']." order by ThreadPostDate DESC limit $limit";

	$result3 = mysql_query($sql3);
	$rst3 = array(
			CommentID=> '',
			CommentPostDate=> '',
			CommentUpdateDate=> '',
			CommentContent=> '',
			MemberID=> '',
			AccountName=> '',
			MemberImage=> '',
	);

	//output all query
	$arr_comments = array();
	$u = 0;
	while ($row3 = mysql_fetch_array($result3)) {
	  $u++;
	  $rst3['CommentID'] = $row3['ThreadID'];
	  $rst3['CommentPostDate'] = $row3['ThreadPostDate'];
	  $rst3['CommentUpdateDate'] = $row3['ThreadUpdateDate'];
	  $rst3['CommentContent'] = $row3['ThreadContent'];
	  $rst3['MemberID'] = $row3['MemberID'];
	  $rst3['AccountName'] = $row3['AccountName'];
	  $rst3['MemberImage'] = $url.$row3['Image'];
	 array_push($arr_comments, $rst3);
	}
	

  $rst['ThreadID'] = $row['ThreadID'];
  $rst['ThreadTitle'] = $row['ThreadTitle'];
  $rst['ThreadPostDate'] = $row['ThreadPostDate'];
  $rst['ThreadUpdateDate'] = $row['ThreadUpdateDate'];
  $rst['ThreadContent'] = $row['ThreadContent'];
  $rst['ThreadType'] = $row['ThreadType'];
  $rst['MemberID'] = $row['MemberID'];
  $rst['LastCommentDate'] = $row['LastCommentDate'];
  $rst['ThreadImages'] = $arr_image;
  $rst['LikeList'] = $arr_likeList;
  $rst['Comments'] = $arr_comments;

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

