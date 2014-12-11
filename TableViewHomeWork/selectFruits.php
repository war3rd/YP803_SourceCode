<?php



date_default_timezone_set("Asia/Taipei");

$now=date("Y-m-d H:i:s");

// 連接資料庫

$link = mysql_connect('localhost', 'root', 'mysql')

 or die('Could not connect: ' . mysql_error());

//選擇資料庫

mysql_select_db('Fruits') or die('Could not select database');

// 執行 SQL 查詢

$query="SELECT * FROM `FruitsItem`";
mysql_query("SET NAMES 'utf8' ");

$result = mysql_query($query) or die('Query failed: ' . mysql_error());
$json_response = array();
    
    while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
        $row_array['id'] = $row['id'];
        $row_array['Title'] = $row['Title'];
        $row_array['EnglishName'] = $row['EnglishName'];
        $row_array['BigImageFileName'] = $row['BigImageFileName'];
        $row_array['IconImageFileName'] = $row['IconImageFileName'];
        //push the values in the array
        array_push($json_response,$row_array);
    }
    echo json_encode($json_response);

//抓取查詢結果

//$row = mysql_fetch_row($result);

//釋放結果所佔的記憶體

//mysql_free_result($result);

// 中斷連接

mysql_close($link);

//var_dump($_POST);

//$message=$_POST['name']." ".$_POST['content'];


