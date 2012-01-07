
<?php
	// github parameter.
	$user = "Powder";
	$repo = "GithubViz";
	
	// Generate api url.
	$apiurl = "https://api.github.com/repos/$user/$repo/contributors";
	//echo "apiurl: $apiurl <br>";
	
	// github api json file
	//$jsonfile = file_get_contents('https://api.github.com/repos/Powder/GithubViz/contributors');
	$jsonfile = file_get_contents($apiurl);
	$jsonarray = json_decode($jsonfile);
?>
