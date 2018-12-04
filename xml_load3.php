<?php
		$str=$_POST['line_name'];

		$url = "http://express.heartrails.com/api/xml?method=getStations&line=${str}";
		$html = file_get_contents($url);
		$xml = simplexml_load_string($html);

		$i=0;

		if ($xml) {
		    // 正常に読み込めた場合の処理
		    foreach ($xml->station as $val) {

		        $data[$i][0] = (string)$val->name;
		        $data[$i][1] = (string)$val->y;
		        $data[$i][2] = (string)$val->x;
						$data[$i][3] = (string)$val->name;
					//$data[$i][3] = $val->prev;
		        $i++;

		    }
		}

		else {
		    // 読み込めなかった場合のエラー処理
		}
//		var_dump($data);
		echo json_encode($data);

?>
