<!-- GithubViz -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<?php include("../static/head.php"); ?>
	</head>
	<body>
		<?php include("../static/header.php"); ?>
		<?php include("../static/nav.php"); ?>
		
		<!-- CONTENT-->
		<section>
			<?php
				// github Username.
				$user = $_POST['User'];

				// Generate api url.
				$apiurl = "https://api.github.com/users/$user";

				// github api json file
				$jsonfile = file_get_contents($apiurl);
				$jsonarray = json_decode($jsonfile);

				// print infos
				echo "<h2>$user</h2><br>";
				echo "<b>UserInformation</b><br>";
				
				// print out the whole json array.
				echo "<pre>";
				print_r($jsonarray);
				echo "</pre>";
				
				echo "Raw json file can be found at <a href='$apiurl' >$apiurl</a> <br>";

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
		</section>
		
		<?php include("../static/footer.php"); ?>
	</body>
</html>
