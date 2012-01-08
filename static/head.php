
<!-- head.php file - begin --> 
<title>GithubViz</title>
<meta name="description" content="GithubViz">
<meta name="keywords" content="github, wrong entertainment, wrong-entertainment.com">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="en-us" />
<meta name="ROBOTS" content="index,follow,archive" />
<meta http-equiv="imagetoolbar" content="false" />
<meta name="MSSmartTagsPreventParsing" content="true" />
<meta name="author" content="Paul Vollmer, wrong-entertainment.com">
<meta name="author" content="Tim Pulver, timpulver.de">
<meta name="Rating" content="General" />
<meta name="revisit-after" content="7 Days" />
<meta name="doc-class" content="Living Document" />

<meta http-equiv="Content-Script-Type" content="text/javascript">

<link rel="stylesheet" type="text/css" href="http://www.wrong-entertainment.com/code/GithubViz/css/stylesheet.css">
<?php
// counter script
$file = fopen("../counter.txt","r+");
$counter = fgets($file, 10);
if($counter == ""){
  $counter = 0;
}
$counter++;
//echo $counter;
rewind($file);
fwrite($file, $counter);
fclose($file);
?>
<!-- head - end -->
