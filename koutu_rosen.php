<?php
set_time_limit(60);
	require "user.php";
	require "xml_load3.php";
	$check = 0;
	$sqluser = user();


	$handle = file("./txt/koutu_rosen.txt");
	foreach($handle as $l){

		if($check == 1){

			if(rtrim($l, "\x00..\x1F") == ''){ $check = 0; break;}

			$word = preg_split("/(）|～|　|（)+/",rtrim($l, "\x00..\x1F"));

			if (strpos($l, "～") === FALSE) break;
				//****************************************ここから
				//sql接続　接続先　ＩＤ　パスワード　の順番で関数に値を入れる
			$link = mysql_connect($sqluser[0], $sqluser[1], $sqluser[2]);

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

			$location_data = rosen_location_data($word[1],$word[2]);
			$location_data2 = rosen_location_data($word[1],$word[3]);
						var_dump($location_data);
			//sqlの本文
			$sql =  "INSERT INTO koutu_rosen(koutu_station1,koutu_station2,koutu_state,koutu_line,station1_location,station2_location) ";
			$sql .= "VALUES(\"${word[2]}\",\"${word[3]}\",\"${word[4]}\",\"${word[1]}\",POINT(\"${location_data[1]}\",\"${location_data[2]}\"),POINT(\"${location_data2[1]}\",\"${location_data[2]}\"))";
			echo $sql;
			//sqlの本文を実行する
			$result_flag = mysql_query($sql);

			if (!$result_flag) {
				die('INSERTクエリーが失敗しました。¥n'.mysql_error());
			}
			//データベースとの接続を終了する
			$close_flag = mysql_close($link);
			//*****************************************ここまで
		}

		if(rtrim($l, "\x00..\x1F") == "【ＪＲ】"){$check = 1;}
	}


?>
