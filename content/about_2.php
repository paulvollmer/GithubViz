<!-- GithubViz -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<?php include("../static/head.php"); ?>
<script src="http://www.wrong-entertainment.com/code/GithubViz/js/processing-1.3.6.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
	
<body>
<?php include("../static/header.php"); ?>
<?php include("../static/nav.php"); ?>

<!-- CONTENT begin -->
<section>
<script src="../js/githubAPI_json.js"></script>
<h1>User Information</h1>
<div id="githubAPI_usergravatar"></div>
<div id="githubAPI_username"></div>
<div id="githubAPI_userinfo"></div>
<!--<h1>Repository Information</h1>
<div id="githubAPI_repoinfo"></div> -->
</section>
<!-- CONTENT end -->

<?php include("../static/footer.php"); ?>
</body>
</html>
