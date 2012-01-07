<!-- GithubViz -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<?php include("../head.php"); ?>
	</head>
	<body>
		<?php include("../header.php"); ?>
		<?php include("../nav.php"); ?>
		
		<!-- CONTENT-->
		<!-- Introduction -->
		<!--<section id="intro">
			<span class="small">sending open sound control</span>
		</section> -->
		<!-- Main content area -->  
		<section>
			<h2>Raw Repo Files</br>JSON Files</h2>
			<div id="introduction">
				<p>
					<h1>Select a Github User.</h1>
					<!-- Formular un den Github usernamen einzugeben. -->
					<form method="post" action="user.php">
					User: <input type="text" name="User"><br>
					<input type="submit">
					</form>
				</p>
			</div>
		</section>
		<!-- Sidebar 
		<aside>
			<p>This is a sidebar.</p>
		</aside> --> 
		
		<?php include("../footer.php"); ?>
	</body>
</html>