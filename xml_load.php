<?php
	//路線の駅のlatlngを取得
	$check = 3;
	$i = 0;
	$xml_handle=$_POST['xml_handle'];
	$handle = file($xml_handle);
	foreach($handle as $l){

		if(strstr($l, "<name>")) {
			$name = preg_split("/(<|>| )+/",rtrim($l, "\x00..\x1F"));
			$check = 2;



		}
		if(strstr($l, '<y>') && $check == 0 ) {

			$xcode = preg_split("/(<|>| )+/",rtrim($l, "\x00..\x1F"));
			$check = 0;

		}
		if(strstr($l, '<x>') && $check == 1 ) {

			$ycode = preg_split("/(<|>| )+/",rtrim($l, "\x00..\x1F"));
			$check = 1;

		}
		if($check == 2 ) {
			$data[$i][0] = $name[2];
			$data[$i][1] = $ycode[2];
			$data[$i][2] = $xcode[2];


			$check = 3;
			$i++;
		}


	}

	 echo json_encode($data);

?>
