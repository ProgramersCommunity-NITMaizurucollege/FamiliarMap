<?php
	require "user.php";
	$sqluser = user();
	$link = mysql_connect($sqluser[0], $sqluser[1], $sqluser[2]);
		if (!$link) {
			die('接続失敗です。'.mysql_error());
		}
		//データベースを選択する
		$today=$_POST['today'];
		$db_selected = mysql_select_db('fm', $link);

		if (!$db_selected){
			die('データベース選択失敗です。'.mysql_error());
		}
		//接続する際の文字コードの指定
		mysql_set_charset('utf8');

		//sqlの本文
//		$sql = "SELECT koutu_line,koutu_station1,X(station1_location),Y(station1_location),koutu_station2,X(station2_location),Y(station2_location),koutu_state FROM koutu_rosen WHERE koutu_time = \"$today\"";

		$sql = "SELECT koutu_line,koutu_station1,koutu_station2,koutu_state FROM koutu_rosen WHERE koutu_time = \"$today\"";

		$result_flag = mysql_query($sql);

		if (!$result_flag) {
			die('SELECTクエリーが失敗しました。¥n'.mysql_error());
		}

		$i=0;
		while ($row = mysql_fetch_assoc($result_flag)) {
//			var_dump($row);
			$data2[$i][0] =	$row['koutu_line'];
			$data2[$i][1] = $row['koutu_station1'];
//			$data2[$i][2] = $row['X(station1_location)'];
//			$data2[$i][3]	= $row['Y(station1_location)'];
			$data2[$i][2] = $row['koutu_station2'];
//			$data2[$i][5] = $row['X(station2_location)'];
//			$data2[$i][6] = $row['Y(station2_location)'];
			$data2[$i][3] = $row['koutu_state'];
			$i++;
//			var_dump($data2[$i]);
		}
		//データベースとの接続を終了する
		$close_flag = mysql_close($link);

//	var_dump($data2);
	echo json_encode($data2);
?>
