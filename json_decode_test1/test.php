
<html>
	<?php
		include 'vars.php';
		echo "User: $user <br>";
		echo "Repo: $repo <br>";
		echo "url: $apiurl <br>";

		// print out the json array.
		echo "<pre>";
		print_r($jsonarray);
		echo "</pre>";
		
		//echo "test:___ $jsonfile <br>";

		echo "<b>JSON Array<br></b>";		
		
		// arraysize of json file.
		$arraySize = sizeof($jsonarray);
		echo "arraySize: $arraySize <br>";
		
		// loop the array
		for ($i=0; $i<$arraySize; $i++) {
			
			$content1 = $jsonarray[$i];
			//echo "### §content1 ";
			$content1size = sizeof($jsonarray[$i]);
			echo "content1size: $content1size <br>";
			
		    $res = isset($jsonarray[$i]);
	
			echo "i: $i , $res ,  <br>";
			
			/*if (in_array("login", $jsonarray[$i])) {
			    echo "Irix enthalten";
			}*/
		}
		
	?>
</html>