<!-- GitHubViz -->
<!doctype html>
<head>
  <?php include("static/head.php"); ?>
</head>

<body>
  <?php include("static/nav.php"); ?>

  <header>
  <h3>Search GitHub User</h3>

	<table width="750" border="1">
		<tr>
			<td><h3>Popular Users</h3></td>
			<td><h3>Popular Repos</h3></td>
		</tr>
		<tr>
			<td>jquery<br>jquery JavaScript Library</td>
			<td>openFrameworks / openFrameworks<br>OpenFrameworks is a cross platform ...</td>
		</tr>
		<tr>
			<td>diaspora<br>Distributes and Contextural social network</td>
			<td>twitter / bootstrap<br>HTML, CSS and JS toolkit from twitter</td>
		</tr>
		<tr>
			<td>facebook<br>We have created a new repository for this</td>
			<td>jquery / jqueryui<br>The offical jQuery user interface library</td>
		</tr>
		<tr>
			<td>openFrameworks<br>OpenFrameworks is a cross platform ...</td>
			<td>jquery / sizzle<br>A sizzlin hot lector engine.</td>
		</tr>
		<tr>
			<td>cinder<br>Cinder is a community-developed, free and ...</td>
			<td>jresig / procesing.js<br>A port of the processing visualisation ...</td>
		</tr>
    </table>
	
  </header>

  <div role="main">
  </div>
  
  <?php include("static/footer.php"); ?>



  <!-- JavaScript at the bottom for fast page loading -->
  <!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.1.min.js"><\/script>')</script>

  <!-- scripts concatenated and minified via build script -->
  <script defer src="js/plugins.js"></script>
  <!-- end scripts -->

  <!-- Asynchronous Google Analytics snippet. Change UA-XXXXX-X to be your site's ID. mathiasbynens.be/notes/async-analytics-snippet 
  <script>
    var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
    g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
    s.parentNode.insertBefore(g,s)}(document,'script'));
  </script> -->

  <!-- Prompt IE 6 users to install Chrome Frame. Remove this if you want to support IE 6.
       chromium.org/developers/how-tos/chrome-frame-getting-started -->
  <!--[if lt IE 7 ]>
  <script defer src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
  <script defer>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
  <![endif]-->
</body>
</html>
