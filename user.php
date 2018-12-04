<?php
function user(){
	$sqluser = file("./user.txt");
	for($i=0;$i<3;$i++){
		$sqluser[$i] = trim($sqluser[$i] ,"\x00..\x1F");
	}
	return $sqluser;
}


?>