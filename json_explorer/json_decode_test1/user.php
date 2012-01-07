
<html>
	<head>
	
	</head>
	
	<body>
		<?php
			/*echo htmlspecialchars($_POST['User']);
			echo (int)$_POST['Repo'];*/
			
			// github parameter.
			$user = $_POST['User'];
			
			// Generate api url.
			$apiurl = "https://api.github.com/users/$user";
			//echo "apiurl: $apiurl <br>";

			// github api json file
			//$jsonfile = file_get_contents('https://api.github.com/repos/Powder/GithubViz/contributors');
			$jsonfile = file_get_contents($apiurl);
			$jsonarray = json_decode($jsonfile);

			
			// print infos
			echo "User: $user <br>";
			echo "url: $apiurl <br>";


			// print out the whole json array.
			echo "<pre>";
			print_r($jsonarray);
			echo "</pre>";
		?>
	</body>
</html>