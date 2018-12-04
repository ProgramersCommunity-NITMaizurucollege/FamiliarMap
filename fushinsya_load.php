<?php
	require "user.php";
	//$date =""
	$sqluser = user();
	$i = 0;
	$link = mysql_connect($sqluser[0], $sqluser[1], $sqluser[2]);

	$date1 = $_POST['date1'];
	$date2 = $_POST['date2'];

		if (!$link) {
			die('接続失敗です。'.mysql_error());
		}

		//データベースを選択する
		$db_selected = mysql_select_db('fm', $link);

		if (!$db_selected){
			die('データベース選択失敗です。'.mysql_error());
		}
		//接続する際の文字コードの指定
		mysql_set_charset('utf8');

		//sqlの本文
		$sql = "SELECT fushinsya_date,fushinsya_place,fushinsya_content1,fushinsya_content2,X(fushinsya_location),Y(fushinsya_location) FROM fushinsya WHERE fushinsya_date BETWEEN '$date1' AND '$date2'";


		$result_flag = mysql_query($sql);

		if (!$result_flag) {
			die('SELECTクエリーが失敗しました。¥n'.mysql_error());
		}

		while ($row = mysql_fetch_assoc($result_flag)) {


			$data2[$i][0] = $row['fushinsya_date'];
			$data2[$i][1] = $row['fushinsya_place'];
			$data2[$i][2] = $row['fushinsya_content1'];
			$data2[$i][3] = $row['fushinsya_content2'];
			$data2[$i][4] = $row['X(fushinsya_location)'];
			$data2[$i][5] = $row['Y(fushinsya_location)'];
			$i++;




		}

		//データベースとの接続を終了する
		$close_flag = mysql_close($link);




//	var_dump( $data2);
		echo json_encode($data2);
?>
