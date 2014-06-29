<?php
date_default_timezone_set('America/Toronto');
$user_input = empty($_POST)?$_GET:$_POST;
//$table = 'Advertisement';
//$firstName = $user_input['firstName'];
//$lastName = $user_input['lastName'];
$school = $user_input['school'];
$major = $user_input['major'];
//$houseNo = $user_input['houseNo'];
//$street = $user_input['street'];
//$city = $user_input['city'];
//$province = $user_input['province'];
//$postalCode = $user_input['postalCode'];
$accountName = $user_input['accountName'];

$password = $user_input['password'];
$password_hash = md5($password);

//$status = $user_input['status'];
$email = $user_input['email'];
//$phone = $user_input['phone'];
//$role = $user_input['role'];


$image = "image/member/";
$FileID=date("Ymd-His") . '-' . rand(100,999);
$image = $image . $FileID. $_FILES['uploaded']['name'];

//connect to database
mysql_connect("localhost", "root", "wechao") or
  die("Could not connect: " . mysql_error());

//select a database
mysql_select_db("WeChao");

$email_check = mysql_query("SELECT email FROM Member WHERE email='$email'");

$do_email_check = mysql_num_rows($email_check);

if($do_email_check > 0){
	$arr_all = array(
  'result' => "Email is already in use!",
);

}
else if($_FILES['uploaded']["error"] == 4)
{
	$sql = "INSERT INTO Member
		(school,major,accountName,password,email)
VALUES ('$school', '$major', '$accountName', '$password_hash', '$email');";
}

else if(move_uploaded_file($_FILES['uploaded']['tmp_name'], $image))
{
		$sql = "INSERT INTO Member
		(school,major,image,accountName,password,email)
VALUES ('$school', '$major', '$image', '$accountName', '$password_hash', '$email');";
		$result = mysql_query($sql);

if($result)
{
$arr_all = array(
  'result' => "succ",
);
}
else
{
$arr_all = array(
  'result' => "insert fail",
);
}

}
else {
  $arr_all = array(
  'result' => "upload image fail",
  );
}


$output = json_encode($arr_all);
print_r($output);

?>
