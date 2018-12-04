<?php
function xml_load($str){
	$check = 0;
	$i = 0;
	$xml_handle=$_POST['xml_handle'];
//	$handle = file("./h22ka26202.xml");
$handle = file($xml_handle);
	foreach($handle as $l){

		if(strstr($l, "<fme:MOJI>{$str}")) {

			$check = 1;
		}
		if(strstr($l, '<gml:posList>') && $check == 1 ) {
			$point[$i] = preg_split("/(<|>| )+/",rtrim($l, "\x00..\x1F"));
			$check = 0;
			$i++;
		}
	}
	return $point;

}
$place_name = $_POST['place_name'];
//$data = xml_load('東大浦');
$data = xml_load($place_name);
for ($i=0;$i<count($data);$i++){

		unset($data[$i][count($data[$i], COUNT_RECURSIVE)-1]);
		unset($data[$i][count($data[$i], COUNT_RECURSIVE)-1],$data[$i][1],$data[$i][0]);
		$data[$i] = array_values($data[$i]);
}
//var_dump($data);

echo json_encode($data);
?>
