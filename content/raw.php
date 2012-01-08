<!-- GithubViz -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<?php include("../static/head.php"); ?>
</head>
	
<body>
<?php include("../static/header.php"); ?>
<?php include("../static/nav.php"); ?>
		
<!-- CONTENT begin -->
<section>
<h1>Explore your raw Files and json Database</h1>
<img src="http://www.wrong-entertainment.com/code/GithubViz/img/content3.png" width="750px">
<div id="introduction">
<p>
<p>Select a Github User.</p>
<!-- Formular um den Github usernamen einzugeben. -->
<form method="post" action="raw_json_user.php">
User: <input type="text" name="User"><br>
<input type="submit">
</form>
</p>
</div>
</section>
<!-- CONTENT end -->
		
<?php include("../static/footer.php"); ?>
</body>
</html>
