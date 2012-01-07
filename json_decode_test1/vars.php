
<?php
$user = 'Powder';
$repo = 'GithubViz';


$jsonfile = file_get_contents('https://api.github.com/repos/Powder/GithubViz/contributors');
$jsonarray = json_decode($jsonfile);

// print out the array.
echo "<pre>";
print_r($jsonarray);
echo "</pre>";

?>
