<?php
  define('DBCONNECTION', 'mysql: host=localhost;dbname=quiz2');
  define('DBUSER','root');
  define('DBPASS','');


  // $link = mysqli_connect('localhost', 'root', '');
  // if(!$link){
	// 	die("Could not connect to database:".mysqli_connect_error());
	// }else{
	// 	//echo "Successfully connected to database server. \n";
	// }
  //
  // $db = mysqli_select_db($link, 'quiz3');
  //
  // if(!$db){
  //   $sql = "CREATE DATABASE IF NOT EXISTS quiz3";
  //   if(mysqli_query($link, $sql)){
  //     $db = mysqli_select_db($link, "quiz3");
  //   }else{
  //     echo "Error creating database:".mysqli_error($link);
  //   }
  // }else{
  // }
  //
  // $conn =new mysqli('localhost', 'root', '' , 'quiz3');
  //
  // $query = '';
  // $sql = file('quiz3.sql');
  // foreach ($sql as $line)	{
  //
  // 	$startWith = substr(trim($line), 0 ,2);
  // 	$endWith = substr(trim($line), -1 ,1);
  //
  // 	if (empty($line) || $startWith == '--' || $startWith == '/*' || $startWith == '//') {
  // 		continue;
  // 	}
  //
  // 	$query = $query . $line;
  // 	if ($endWith == ';') {
  // 		mysqli_query($conn,$query) or die('<div class="error-response sql-import-response">Problem in executing the SQL query <b>' . $query. '</b></div>');
  // 		$query= '';
  // 	}
  // }
  // echo '<div class="success-response sql-import-response"></div>';

  // $link = mysqli_connect('localhost', 'root', '');

 ?>
