<!-- GithubViz -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<?php include("../static/head.php"); ?>
	<script src="../js/libs/processing-1.3.6.min.js"></script>
	<link rel="stylesheet" href="../css/jquery-ui/themes/base/jquery.ui.all.css">
	<script src="../js/libs/jquery-1.7.1.js"></script>
	<script src="../js/libs/ui/jquery.ui.core.js"></script>
	<script src="../js/libs/ui/jquery.ui.widget.js"></script>
	<script src="../js/libs/ui/jquery.ui.accordion.js"></script>
	<link rel="stylesheet" href="../css/jquery-ui/demos.css">
	<script>
	$(function() {
		$( "#accordion1" ).accordion({
			heightStyle: "content"
		});
	});
	$(function() {
		$( "#accordion2" ).accordion({
			heightStyle: "content"
		});
	});
	</script>
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

<div >
<div id="accordion1">
	<h3><a href="#section1">List</a></h3>
	<div>
		<div id="githubAPI_userinfo"></div>
			
	</div>
	<h3><a href="#section1">Raw File</a></h3>
	<div>
		<?php
		// github Username.
		$user = $HTTP_GET_VARS["user"];
		// Generate api url.
		$apiurl = "https://api.github.com/users/$user";
		// github api json file
		$jsonfile = file_get_contents($apiurl);
		$jsonarray = json_decode($jsonfile);
		// print out the whole json array.
		echo "<pre>";
		print_r($jsonarray);
		echo "</pre>";
		?>
	</div>
</div>

<h1>Repository Information</h1>
<div id="githubAPI_repoinfo"></div>
	
<div id="accordion2" width="750px">
	<h3><a href="#section1">Section 1</a></h3>
	<div>
		<p>Mauris mauris ante, blandit et, ultrices a, susceros. Nam mi. Proin viverra leo ut odio.<br>
			Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
	</div>
	<h3><a href="#section2">Section 2</a></h3>
	<div>
		<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus.<br>
			Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit,<br>
			faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna. </p>
	</div>
	<h3><a href="#section3">Section 3</a></h3>
	<div>
		<p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.<br>
		Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper.<br>
		Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui. </p>
		<ul>
			<li>List item</li>
			<li>List item</li>
			<li>List item</li>
			<li>List item</li>
			<li>List item</li>
			<li>List item</li>
			<li>List item</li>
		</ul>
		<a href="#othercontent">Link to other content</a>
	</div>
</div>
</div>
</section>
<!-- CONTENT end -->

<?php include("../static/footer.php"); ?>
</body>
</html>
