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
<script src="js/libs/processing-1.3.6.min.js" type="text/javascript"></script>

<!-- jquery -->
<script src="js/get_url_vars.js"></script>


<script>
	/*
	 * javascript to generate text line over canvas
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
				$("#github_userinfo").append("<span> from " + user_data.location + ",</span>");
			}
			
			
			// check if a website url exist
			if(user_data.blog != null) {
				// save data content to temp variable
				var temp = user_data.blog;
				// remove http://www. from url
				temp = temp.replace("http://", "");
				temp = temp.replace("www.", "");
				$("#github_userinfo").append("<a href='" + user_data.blog + "'> " + temp + "</a>");
			}
			
			// search form
			$("#github_userinfo").append("<form action='discover.php' style='position: absolute; top: 85px; right: 10px;'>" +
       		                             "<input type='text' size='30' name='user' style='padding: 5px; background-color: #999; border: 1px; color: #fff;'> " + 
			                             "<input type='submit' class='Button' value='Search' style='padding: 5px; background-color:#39F; color:#fff; width:70px; border: 0px;'>" +
			                             "</form><br/>");
			$("#github_userinfo").append("<br>");	
		});
  </script>



<!--
<script type="text/javascript">  
	function drawSomeText(id) {  
		var pjs = Processing.getInstanceById(id);  
  		var text = document.getElementById('inputtext').value;

  		/*
   		 * Creates an unordered list containing Github user data.
   		 * Will be placed inside a div-element with id "github_userinfo"
   		 */
  		var gitUsername = getUrlVars()["user"];
  		var gitBaseUrl = "http://github.com/api/v2/json/";
  		var gitUserUrl = "user/show/";
  		var gitRepoUrl = "repos/show/";
  		var callback = "?callback=?";	
  		var gravatarUrl = "http://www.gravatar.com/avatar/";
  		
		$.getJSON(gitBaseUrl + gitUserUrl + gitUsername + callback,
  			function(json, statuts) {			
    			var user_data = json.user;

    			// binding processing.js function
    			pjs.userdata(user_data.gravatar_id,
							 user_data.company,
							 user_data.name,
							 user_data.created_at,
							 user_data.location,
							 user_data.public_repo_count,
							 user_data.public_gist_count,
							 user_data.blog,
							 user_data.following_count,
							 user_data.id,
							 user_data.type,
							 user_data.permission,
							 user_data.followers_count,
							 user_data.login,
							 user_data.email);
  		});

  		/**
   		 * Generates an unordered list containing all the repositories of a certain user.
   		 * The list will be added to the div-element with id "github_repositories".
   		 */
  		//var username = "Powder";
  		$.getJSON("http://github.com/api/v2/json/repos/show/" + gitUsername + "?callback=?",
  			function(json, statuts) {
    			//$("#github_repositories").append("<ul id='repositoriy-list'></ul>");
				$.each(json.repositories, function(i){
					var type = this['type'];
					var language = this['language'];
					var has_downloads = this['has_downloads'];
					var url = this['url']
					var homepage = this['homepage']
					var pushed_at = this['pushed_at']
					var created_at = this['created_at']
					var fork = this['fork']
					var has_wiki = this['has_wiki']
					var score = this['score']
					var size = this['size']
					var private_repo = this['private_repo']
					var name = this['name'];
					var watchers = this['watchers'];
					var owner = this['owner'];
					var open_issues = this['open_issues'];
					var description = this['description'];
					var forks = this['forks'];
					var has_issues = this['has_issues'];
					var followers = this['followers'];
					var pushed = this['pushed'];
					var created = this['created'];
					var username = this['username'];
					
					// binding processing.js function
					pjs.repodata(type,
		  						 language,
		  						 has_downloads,
		  						 url,
		  						 homepage,
		  						 pushed_at,
		  						 created_at,
		  						 fork,
		  						 has_wiki,
		  						 score,
		  						 size,
		  						 private_repo,
		  						 name,
		  						 watchers,
		  						 owner,
		  						 open_issues,
		  						 description,
		  						 forks,
		  						 has_issues,
		  						 followers,
		  						 pushed,
		  						 created,
		  						 username);
    				});
  				});

  		//pjs.drawText(text);
	}
</script> -->
</head>
	

<body>
<?php include("static/nav.php"); ?>

<div id="github_userinfo" style="width: 100%; margin-left: 30px; margin-top: 30px; margin-bottom: 70px;"></div>

<!-- processing.js canvas -->
<div class="githubviz_canvas">
	
  <!-- <canvas id="Creating" data-processing-sources="githubviz.pde">
    <p>Your browser does not support the canvas tag.</p>
    <!-- Note: you can put any alternative content here. --
  </canvas>
  <noscript>
    <p>JavaScript is required to view the contents of this page.</p>
  </noscript>
-->

<canvas id="sketch1" data-processing-sources="githubviz_b.pde"></canvas>
</div> 




<?php include("static/footer.php"); ?>
</body>
</html>
