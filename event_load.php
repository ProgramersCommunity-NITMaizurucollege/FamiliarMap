<?php
	require "user.php";
	//$date =""
	$sqluser = user();
	$i = 0;
	$link = mysql_connect($sqluser[0], $sqluser[1], $sqluser[2]);

	$date = $_POST['date'];

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
		$sql = "SELECT event_name,event_place,event_date,event_content,X(event_location),Y(event_location) FROM event WHERE event_date > \"$date\"";


		$result_flag = mysql_query($sql);

		if (!$result_flag) {
			die('SELECTクエリーが失敗しました。¥n'.mysql_error());
		}

		while ($row = mysql_fetch_assoc($result_flag)) {


			$data2[$i][0] = $row['event_name'];
			$data2[$i][1] = $row['event_place'];
			$data2[$i][2] = $row['event_date'];
			$data2[$i][3] = $row['event_content'];
			$data2[$i][4] = $row['X(event_location)'];
			$data2[$i][5] = $row['Y(event_location)'];
			$i++;




		}

		//データベースとの接続を終了する
		$close_flag = mysql_close($link);




	//var_dump( $data2);
	echo json_encode($data2);
?>
