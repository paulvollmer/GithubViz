<!-- GithubViz -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<?php include("../static/head.php"); ?>

<body>
<?php include("../static/header.php"); ?>
<?php include("../static/nav.php"); ?>
		
<!-- CONTENT begin -->
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

				
				// Parsing test
				///////////////////////////////////////////////
				/*echo "<b>JSON Array<br></b>";
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
					echo "contentSize: $contentSize <br>";*/


					// loop the array
					//for ($j=0; $j<$contentSize; $j++) {
						//$contentB = $content[$j];
						//echo "content [$j]";
						//echo "<pre>";
						//print_r($content_b);
						//echo "</pre>";
					//}


				    //$res = isset($jsonarray[$i]);
					//echo "i: $i , $res ,  <br>";
					

					//if (in_array("login", $content[$i])) {
					   //echo "Irix enthalten";
					//}
			?>
</section>
<!-- CONTENT end -->
		
<?php include("../static/footer.php"); ?>
</body>
</html>
