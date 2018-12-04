<?php

$str 	= $_POST['line'];
$str2	=	$_POST['station1'];
$str3	=	$_POST['station2'];
/*$str = "舞鶴線";
$str2 = "梅迫";
$str3 = "綾部";*/
	$url = "http://express.heartrails.com/api/xml?method=getStations&line=JR${str}";
	$html = file_get_contents($url);
	$xml = simplexml_load_string($html);
	$str2 = str_replace("駅", "", $str2);
	$str3	= str_replace("駅","",$str3);
	$i=0;
	$data2 = null;

	if ($xml) {
				// 正常に読み込めた場合の処理
			foreach ($xml->station as $val) {



					$data[$i][0] = (string)$val->name;
						$data[$i][1] = (string)$val->y;
						$data[$i][2] = (string)$val->x;
						$data[$i][3] = (string)$val->next;
						$data[$i][4] = (string)$val->prev;
					$i++;
			}
	}

	else {
		// 読み込めなかった場合のエラー処理
	}

/*		$n="a";
	$m=0;
	$check = false;
	$check2 = false;

	while(strcmp($n,"終了") != 0){
	//while($k<10){
		for($s=0;$s<$i;$s++){

			if(strcmp($data[$s][0] , $str2) == 0 && $check2 === false){
				$n = $data[$s][3];
				$data2[0][0] = $data[$s][0];
				$data2[0][1] = $data[$s][1];
				$data2[0][2] = $data[$s][2];
				$m++;
				$check2 = true;
				if(strcmp($data[$s][3]['nil'][0] , "true") == 0 ){
					$n = "終了";
					break;

				}

			}


			if(strcmp($data[$s][0] , $n) == 0){

				$n = $data[$s][3];
				$data2[$m][0] = $data[$s][0];
				$data2[$m][1] = $data[$s][1];
				$data2[$m][2] = $data[$s][2];
				$m++;
				if(strcmp($data[$s][3]['nil'][0] , "true") == 0 && strcmp($data2[$m-1][0] , $str3) == 0){
					$check = true;
					$n = "終了";
					break;
				}

				if(strcmp($data2[$m-1][0] , $str3) == 0){
					$check = true;
					$n = "終了";
					break;

				}


				if(strcmp($data[$s][3]['nil'][0] , "true") == 0 ){
					$n = "終了";
					break;

				}



			}

		}
		//$k++;
	}

	if($check == false){
		$n=null;
		$data2 =null;
		$m=0;
		$check2 = false;
		while(strcmp($n,"終了") != 0){
			for($s=0;$s<$i;$s++){

				if(strcmp($data[$s][0] , $str2) == 0 && $check2 === false){
					$n = $data[$s][4];
					$data2[0][0] = $data[$s][0];
					$data2[0][1] = $data[$s][1];
					$data2[0][2] = $data[$s][2];
					$m++;
					$check2 = true;


				}


				if(strcmp($data[$s][0] , $n) == 0){

					$n = $data[$s][4];
					$data2[$m][0] = $data[$s][0];
					$data2[$m][1] = $data[$s][1];
					$data2[$m][2] = $data[$s][2];


					if(strcmp($data[$s][4]['nil'][0] , "true") == 0 && strcmp($data2[$m][0] , $str3) == 0){
						$n = "終了";

					}

					if(strcmp($data2[$m][0] , $str3) == 0){
						$n = "終了";

					}


					if(strcmp($data[$s][4]['nil'][0] , "true") == 0 ){
						$n = "終了";

					}

					$m++;

				}

			}

		}
	}*/

	$n="a";
	$m=0;
	$check = false;
	$check2 = false;

	while(strcmp($n,"終了") != 0){
	//while($k<10){
		for($s=0;$s<$i;$s++){

			if(strcmp($data[$s][0] , $str2) == 0 && $check2 === false){
				$n = $data[$s][3];
				$data2[0][0] = $data[$s][0];
				$data2[0][1] = $data[$s][1];
				$data2[0][2] = $data[$s][2];
				$m++;
				$check2 = true;
				if(strcmp($data[$s][3], "") == 0 ){
					$n = "終了";
					break;

				}

			}


			if(strcmp($data[$s][0] , $n) == 0){

				$n = $data[$s][3];
				$data2[$m][0] = $data[$s][0];
				$data2[$m][1] = $data[$s][1];
				$data2[$m][2] = $data[$s][2];
				$m++;
				if(strcmp($data[$s][3], "") == 0 && strcmp($data2[$m-1][0] , $str3) == 0){
					$check = true;
					$n = "終了";
					break;
				}

				if(strcmp($data2[$m-1][0] , $str3) == 0){
					$check = true;
					$n = "終了";
					break;

				}


				if(strcmp($data[$s][3], "") == 0 ){
					$n = "終了";
					break;

				}



			}

		}
		//$k++;
	}

	if($check == false){
		$n=null;
		$data2 =null;
		$m=0;
		$check2 = false;
		while(strcmp($n,"終了") != 0){
			for($s=0;$s<$i;$s++){

				if(strcmp($data[$s][0] , $str2) == 0 && $check2 === false){
					$n = $data[$s][4];
					$data2[0][0] = $data[$s][0];
					$data2[0][1] = $data[$s][1];
					$data2[0][2] = $data[$s][2];
					$m++;
					$check2 = true;


				}


				if(strcmp($data[$s][0] , $n) == 0){

					$n = $data[$s][4];
					$data2[$m][0] = $data[$s][0];
					$data2[$m][1] = $data[$s][1];
					$data2[$m][2] = $data[$s][2];


					if(strcmp($data[$s][4] , "") == 0 && strcmp($data2[$m][0] , $str3) == 0){
						$n = "終了";

					}

					if(strcmp($data2[$m][0] , $str3) == 0){
						$n = "終了";

					}


					if(strcmp($data[$s][4] , "") == 0 ){
						$n = "終了";

					}

					$m++;

				}

			}

		}
	}

/*$str = "舞鶴線";
$str2 = "梅迫";
$str3 = "綾部";*/
//	var_dump($data2);
	return json_encode($data2);
?>
