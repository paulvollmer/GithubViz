<?php
$file = fopen("counter.txt","r+");
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