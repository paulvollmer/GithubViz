
<html>
	<head>
	
	</head>
	
	<body>
		<?php
			//include 'vars.php';
			
			/*echo htmlspecialchars($_POST['User']);
			echo (int)$_POST['Repo'];*/
			
			// github parameter.
			$user = $_POST['User']; //"Powder";
			$repo = $_POST['Repo']; //"GithubViz";
			
			// Generate api url.
			$apiurl = "https://api.github.com/repos/$user/$repo/contributors";
			//echo "apiurl: $apiurl <br>";

			// github api json file
			//$jsonfile = file_get_contents('https://api.github.com/repos/Powder/GithubViz/contributors');
			$jsonfile = file_get_contents($apiurl);
			$jsonarray = json_decode($jsonfile);
			
			
			
			// print infos
			echo "User: $user <br>";
			echo "Repo: $repo <br>";
			echo "url: $apiurl <br>";


			// print out the whole json array.
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

				$content = $jsonarray[$i];
				echo "array [$i]";
				echo "<pre>";
				print_r($content);
				echo "</pre>";
				$contentSize = sizeof($content);
				echo "contentSize: $contentSize <br>";


				// loop the array
				/*for ($j=0; $j<$contentSize; $j++) {
					//$contentB = $content[$j];
					echo "content [$j]";
					echo "<pre>";
					print_r($content_b);
					echo "</pre>";
				}*/


			    /*$res = isset($jsonarray[$i]);

				echo "i: $i , $res ,  <br>";
				*/

				/*if (in_array("login", $content[$i])) {
				    echo "Irix enthalten";
				}*/
			}

		?>
	</body>
</html>