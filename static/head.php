<?php

echo"<meta charset=\"utf-8\">\n";

// Use the .htaccess and remove these lines to avoid edge case issues.
// More info: h5bp.com/b/378
echo"<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">
<title>GitHubViz</title>
<meta name=\"description\" content=\"GitHubViz\">
<meta name=\"keywords\" content=\"github, github visualisation, visualisation, data, timpulver.de, wrong entertainment, wrong-entertainment.com\">
<meta name=\"author\" content=\"Paul Vollmer, wrong-entertainment.com\">
<meta name=\"author\" content=\"Tim Pulver, timpulver.de\">\n";

// Mobile viewport optimized: h5bp.com/viewport -->
echo"<meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\n";

// Import css stylesheet
echo"<link rel=\"stylesheet\" href=\"css/style.css\">\n";

// Import the counter.php file for counting every site load.
include("static/counter.php");

// All JavaScript at the bottom, except this Modernizr build incl. Respond.js
// Respond is a polyfill for min/max-width media queries.
// Modernizr enables HTML5 elements & feature detects;
// for optimal performance, create your own custom Modernizr build:
// www.modernizr.com/download/
echo"<script src=\"js/libs/modernizr-2.0.6.min.js\"></script>";

?>