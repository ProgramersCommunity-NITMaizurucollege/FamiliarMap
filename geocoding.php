<?php
	function geocoding($data){

		$url = "http://www.geocoding.jp/?q=${data}";
		$html = file_get_contents($url);
		$html = explode( "\n", $html );
		$cnt = count( $html );
		//$html[29] = str_replace(array(">", "b","/"),"",$html[29]);

		$word = preg_split("/(　|: |<|>)+/",$html[29]);
		//print $word[9] . "<br>\n";
		//print $word[11] . "<br>\n";
	var_dump($word);
		return array($word[9],$word[13]);

	}
?>
