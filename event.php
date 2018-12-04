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


	$handle = file("./txt/event.txt");
	foreach($handle as $l => $val){



		if(rtrim($val, "\x00..\x1F") == "◆タイトル"){
			$title = rtrim($handle[$l+1], "\x00..\x1F");
			$title = txtchange($title);
		}

		if(rtrim($val, "\x00..\x1F") == "◆日時"){
			$date = preg_split("/(年|月|日|（|）|時|分|～)+/",rtrim($handle[$l+1], "\x00..\x1F"));
			$date2 = "${date[0]}-${date[1]}-${date[2]}";
			$date2 = txtchange($date2);
		}

		if(rtrim($val, "\x00..\x1F") == "◆場所"){
			$place = preg_split("/(\s)+/",rtrim($handle[$l+1], "\x00..\x1F"));
			$place[0] = txtchange($place[0]);
			$location = geocoding($place[0]);
		}

		if(rtrim($val, "\x00..\x1F") == "◆内容"){
			$content = $handle[$l+1];
			$content = txtchange($content);
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

		$sql = "INSERT INTO event(event_name,event_place,event_date,event_location,event_content) VALUES(\"${title}\",\"${place[0]}\",\"${date2}\",POINT(\"${location[0]}\",\"${location[1]}\" ),";
		$sql .="\"${content}\")";

		echo $sql;
		$result_flag = mysql_query($sql);

		if (!$result_flag) {
			die('INSERTクエリーが失敗しました。¥n'.mysql_error());
		}
		$close_flag = mysql_close($link);

?>
