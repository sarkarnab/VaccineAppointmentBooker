<?php
define ( 'DB_HOST', 'localhost' );
define ( 'DB_NAME', 'vaccineappointmentsystem' );
define ( 'DB_USER', 'root' );
define ( 'DB_PASSWORD', '' );

$con = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
if (!$con) {
    error_log("Failed to connect to MySQL: " . mysqli_error($con));
    die('Internal server error');
}

$db = mysqli_select_db($con, DB_NAME);
if (!$db) {
    die("Database selection failed: " . mysqli_error($con));
}


session_start (); // starting the session for user profile page //
if (! empty ( $_POST ['user'] ))
// checking the 'user' name which is from Sign-In.html, is it empty or have some text
{
	$query = mysqli_query ($con, "SELECT * FROM Login where email = '$_POST[user]' AND password = '$_POST[pass]'" ) or die ( mysqli_error () );
	$row = mysqli_fetch_array ( $query ) or die ( mysqli_error () );

	if (! empty ( $row ['email'] ) and ! empty ( $row ['password'] )) {
		$_SESSION ['email'] = $row ['email'];
		$_SESSION ['role'] = $row ['role'];
		header ( 'Location:Home.php' );
	} else {
		echo "SORRY... YOU ENTERD WRONG ID AND PASSWORD... PLEASE RETRY...";
	}
} else {
	echo "Enter username and password again";
}
?>
