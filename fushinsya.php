<?php
	require "user.php";
	require "geocoding.php";

	function txtchange($txt){
				$txt = preg_replace('/^[ 　]+/u', '', $txt);
				$txt = preg_replace('/[ 　]+$/u', '', $txt);
				$txt = trim($txt, " ");

				return $txt;
	}


	$check = 0;
	$sqluser = user();


	$handle = file("./txt/fushinsya.txt");
	foreach($handle as $l => $val){



		if(strstr(rtrim($val, "\x00..\x1F"), "●日時")){

			$date = preg_split("/(：|年|月|日|（|）|時|分|～)+/",rtrim($handle[$l], "\x00..\x1F"));
			$date2 = "${date[1]}-${date[2]}-${date[3]} ${date[5]}:${date[6]}:00}";
			$date2 = mb_convert_kana($date2, 'kvhrn');
			$date2 = txtchange($date2);
		}

		if(strstr(rtrim($val, "\x00..\x1F"), "●場所")){

			$place = preg_split("/(\s|：)+/",rtrim($handle[$l], "\x00..\x1F"));
			$place[1] = txtchange($place[1]);
			$location = geocoding($place[1]);
		}

		if(rtrim($val, "\x00..\x1F") == "●概要"){
			$content = $handle[$l+1];
			$content = txtchange($content);
		}

		if(rtrim($val, "\x00..\x1F") == "●不審者の特徴"){
			$content2 = $handle[$l+1];
			$content2 = txtchange($content2);
		}
	}



		$link = mysql_connect($sqluser[0], $sqluser[1], $sqluser[2]);
		if (!$link) {
			die('接続失敗です。'.mysql_error());
		}

		$db_selected = mysql_select_db('fm', $link);
		if (!$db_selected){
			die('データベース選択失敗です。'.mysql_error());
		}
		mysql_set_charset('utf8');

		$sql = "INSERT INTO fushinsya(fushinsya_date,fushinsya_place,fushinsya_content1,fushinsya_content2,fushinsya_location) VALUES(\"${date2}\",\"${place[1]}\",\"${content}\",\"${content2}\",POINT(\"${location[0]}\",\"${location[1]}\"))";
		echo $sql;
		$result_flag = mysql_query($sql);

		if (!$result_flag) {
			die('INSERTクエリーが失敗しました。¥n'.mysql_error());
		}
		$close_flag = mysql_close($link);

?>
