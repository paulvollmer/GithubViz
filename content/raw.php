<!-- GithubViz -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<?php include("../static/head.php"); ?>
	</head>
	<body>
		<?php include("../static/header.php"); ?>
		<?php include("../static/nav.php"); ?>
		
		<!-- CONTENT-->
		<section>
			<h2>Raw Repo Files</br>JSON Files</h2>
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
		
		<?php include("../static/footer.php"); ?>
	</body>
</html>