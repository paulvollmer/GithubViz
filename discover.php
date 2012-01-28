<!-- GitHubViz -->
<!doctype html>
<head>
<?php include("static/head.php"); ?>




<!-- javascript src -->

<!-- jquery -->
<script src="js/libs/jquery-1.7.1.min.js"></script>

<!-- processing.js> -->
<!--[if lt IE 9]>
	<script type="text/javascript">alert("Your browser does not support the canvas tag.");</script>
<![endif]-->
<script src="js/libs/processing.js" type="text/javascript"></script>
<script type="text/javascript">function getProcessingSketchID () { return 'Creating'; }</script>

<!-- jquery -->
<script src="js/get_url_vars.js"></script>



<script>
	/*
	 * Creates an unordered list containing Github user info and an image with the avatar.
	 * Will be placed inside a div-element with id "github_userinfo"
	 */
	
	/* Set a Github Username you want to discover. */
	var gitUsername = getUrlVars()["user"];
	 
	$.getJSON("http://github.com/api/v2/json/user/show/" + gitUsername + "?callback=?",
		function(json, statuts) {			
			var user_data = json.user;
			//alert(user_data.login);
			
			// gravatar image
			$("#github_userinfo").append("<img id='github_avatar' width='50px' src='" + "http://www.gravatar.com/avatar/" + user_data.gravatar_id + "' />");
			
			// user login name
			$("#github_userinfo").append("<b style='color: #48A1F0; font-size: 14pt;'> " + user_data.login + "</b>");
			
			// check if a locatio exist
			if(user_data.location != null) {
				$("#github_userinfo").append("<span> from " + user_data.location + ". </span>");
			}
			
			// check if a website url exist
			if(user_data.blog != null) {
				$("#github_userinfo").append("website <a href='" + user_data.blog + "'>link</a>");
			}
		});
	  
  </script>
</head>
	

<body>
<?php include("static/nav.php"); ?>

<div id="github_userinfo" style="margin-left: 30px; margin-top: 30px; margin-bottom: 70px;"></div>

<div style="margin-top: 40px; margin-left: 30px;">
	
	
	
	<?php
		$userVar = $_GET["user"];
		echo"<h1>", $userVar, "</h1>";
	?>
</div>

	
<!-- processing.js canvas -->
<div class="githubviz_canvas">
  <canvas id="Creating" data-processing-sources="githubviz.pde">
    <p>Your browser does not support the canvas tag.</p>
    <!-- Note: you can put any alternative content here. -->
  </canvas>
  <noscript>
    <p>JavaScript is required to view the contents of this page.</p>
  </noscript>
</div>


<?php include("static/footer.php"); ?>
</body>
</html>
