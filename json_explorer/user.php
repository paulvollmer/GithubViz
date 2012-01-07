
<html>
	<head>
	
	</head>
	
	<body>
		<?php
			// github Username.
			$user = $_POST['User'];
			
			// Generate api url.
			$apiurl = "https://api.github.com/users/$user";

			// github api json file
			$jsonfile = file_get_contents($apiurl);
			$jsonarray = json_decode($jsonfile);
			
			// print infos
			echo "<p>User: $user <br>";
			echo "JSON File URL: $apiurl <br></p>";
			echo "<p><b>User Information</b></p>";
			
			// print out the whole json array.
			echo "<pre>";
			print_r($jsonarray);
			echo "</pre>";
			
			
			echo "<p><b>Repository Information</b></p>";
			// Generate api url.
			$apiurl = "https://api.github.com/users/$user/repos";
			// github api json file
			$jsonfile = file_get_contents($apiurl);
			$jsonarray = json_decode($jsonfile);
			// print out the whole json array.
			echo "<pre>";
			print_r($jsonarray);
			echo "</pre>";
		?>
	</body>
</html>